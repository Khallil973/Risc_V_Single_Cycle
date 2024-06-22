module register_file(clk,rst,A1,A2,A3,WD3,WE3,RD1,RD2);

    input clk,rst,WE3;
    input [4:0] A1,A2,A3;
    input [31:0] WD3;

    output [31:0] RD1,RD2;

    //Creation of memory 
    reg [31:0] Registers [31:0];

    //Read functionality
    assign RD1 = (!rst) ? 32'h00000000 : Registers[A1];
    assign RD2 = (!rst) ? 32'h00000000 : Registers[A2];

    //Write Enable Functionality
    always @ (posedge clk) begin
            if(WE3) begin
                Registers[A3] <= WD3;
            end
    end
   // According to instruction my rs1 is 9 = 01001
    initial begin
       Registers[5] = 32'h00000006;
       Registers[6] = 32'h0000000A; //10 into decimal
   //     Registers[11] = 32'h0000028;
    //    Registers[12] = 32'h0000030;
    end

endmodule