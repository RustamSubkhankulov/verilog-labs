module rom #(parameter ADDR_WIDTH = 5, parameter DATA_WIDTH = 8)(
    
    /* Clocking signal */
    input wire clk,

    /* Input address lines */
    input wire [ADDR_WIDTH - 1:0]addr,
    
    /* Output data lines */
    output reg [DATA_WIDTH - 1:0]data
);

/* 2**ADDR_WIDTH memory cells DATA_WIDTH bites wide each */
reg [DATA_WIDTH - 1:0]mem[2**ADDR_WIDTH - 1:0];

initial begin

    /* Initialize memory with file contents */
    $readmemh("misc/rom_contents.txt", mem);
    data <= mem[0];
end

always @(posedge clk) begin

    /* Assign output data lines with data from requested addr each clk */
    data <= mem[addr];
end

endmodule
