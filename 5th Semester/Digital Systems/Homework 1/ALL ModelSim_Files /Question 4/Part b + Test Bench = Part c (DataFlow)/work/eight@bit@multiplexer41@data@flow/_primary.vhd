library verilog;
use verilog.vl_types.all;
entity eightBitMultiplexer41DataFlow is
    port(
        I0              : in     vl_logic_vector(7 downto 0);
        I1              : in     vl_logic_vector(7 downto 0);
        I2              : in     vl_logic_vector(7 downto 0);
        I3              : in     vl_logic_vector(7 downto 0);
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        D               : out    vl_logic_vector(7 downto 0)
    );
end eightBitMultiplexer41DataFlow;
