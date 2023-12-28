library verilog;
use verilog.vl_types.all;
entity eightBitAU_GateLevel is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic;
        S               : in     vl_logic_vector(1 downto 0);
        Z               : out    vl_logic;
        cout            : out    vl_logic;
        D               : out    vl_logic_vector(7 downto 0)
    );
end eightBitAU_GateLevel;
