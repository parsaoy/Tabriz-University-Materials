library verilog;
use verilog.vl_types.all;
entity eightBitCounter is
    port(
        Data_in         : in     vl_logic_vector(7 downto 0);
        INC             : in     vl_logic;
        Clear           : in     vl_logic;
        Load            : in     vl_logic;
        CountEN         : in     vl_logic;
        clk             : in     vl_logic;
        Output          : out    vl_logic_vector(7 downto 0)
    );
end eightBitCounter;
