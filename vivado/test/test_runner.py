import os
from pathlib import Path
from cocotb.runner import get_runner


def run_tests(test_name: str, test_cases: list[str] = None):

    test_name = test_name.split('/')
    top_module = test_name[-1]
    src_file = '/'.join(test_name)+'.sv'
    test_dir = '/'.join(test_name[:-1])

    sim = os.getenv('SIM', 'icarus')
    vivado_path = Path(__file__).parent.parent
    runner = get_runner(sim)
    runner.build(
        verilog_sources=[vivado_path/'src'/Path(src_file)],
        hdl_toplevel=top_module,
        build_dir=vivado_path/'test'/'.sim'
    )
    runner.test(
        hdl_toplevel=top_module,
        test_module=top_module+'_tb',
        build_dir=vivado_path/'test'/'.sim',
        test_dir=vivado_path/'test'/Path(test_dir),
        testcase=test_cases
    )


def test_counter(): run_tests('counter')