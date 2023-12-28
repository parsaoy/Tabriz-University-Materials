library verilog;
use verilog.vl_types.all;
entity Normal_Encoder83 is
    port(
        Data_in         : in     vl_logic_vector(7 downto 0);
        codeOut         : out    vl_logic_vector(2 downto 0)
    );
end Normal_Encoder83;
