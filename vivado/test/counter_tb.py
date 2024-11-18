import cocotb
from cocotb.triggers import Timer, FallingEdge, RisingEdge
from cocotb.clock import Clock
import matplotlib.pyplot as plt


@cocotb.test()
async def counter_tb(dut):

    cocotb.start_soon(Clock(dut.clk, 1, units='ns').start())
    dut.rst.value = 1

    await FallingEdge(dut.clk)
    dut.en.value = 1
    dut.rst.value = 0

    values = []
    for _ in range(100): 
        await Timer(1, units='ns')
        values.append(dut.count.value.integer)

    plt.plot(values)
    plt.show()