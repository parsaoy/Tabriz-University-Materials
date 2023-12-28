library verilog;
use verilog.vl_types.all;
entity Decoder24_DataFlow is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        E               : in     vl_logic;
        D               : out    vl_logic_vector(3 downto 0)
    );
end Decoder24_DataFlow;
