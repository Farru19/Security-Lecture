import angr
import claripy


proj = angr.Project('angry', auto_load_libs=False)

password = claripy.BVS('password', 8 * 8)

initial_state = proj.factory.entry_state(stdin=angr.SimFileStream(name='stdin', content=password, has_end=True))

simgr = proj.factory.simulation_manager(initial_state)

simgr.explore(find=0x401489, avoid=0x4013db)

if simgr.found:
    solution_state = simgr.found[0]
    solution = solution_state.solver.eval(password, cast_to=bytes).decode('utf-8')
    print(f"Found password: {solution}")
else:
    print("No password captured")
