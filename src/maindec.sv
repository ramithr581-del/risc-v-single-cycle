`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2026 19:10:49
// Design Name: 
// Module Name: maindec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module maindec(
    input  logic [6:0]  op,         // Opcode of the instruction
    output logic [1:0]  ResultSrc,  // Selects ALU, memory, or PC+4
    output logic        MemWrite,   // Data memory write enable
    output logic        Branch,     // Branch instruction flag
    output logic        ALUSrc,     // ALU source select
    output logic        RegWrite,   // Register file write enable
    output logic        Jump,       // Jump instruction flag
    output logic [1:0]  ImmSrc,     // Immediate type selector
    output logic [1:0]  ALUOp       // High-level ALU operation
);

    always_comb begin
        // Safe defaults for unsupported instructions
        ResultSrc = 2'b00;
        MemWrite  = 1'b0;
        Branch    = 1'b0;
        ALUSrc    = 1'b0;
        RegWrite  = 1'b0;
        Jump      = 1'b0;
        ImmSrc    = 2'b00;
        ALUOp     = 2'b00;

        case (op)

            // R-type: ADD, SUB, AND, OR, SLT
            7'b0110011: begin
                ResultSrc = 2'b00;
                MemWrite  = 1'b0;
                Branch    = 1'b0;
                ALUSrc    = 1'b0;
                RegWrite  = 1'b1;
                Jump      = 1'b0;
                ALUOp     = 2'b10;
            end

            // I-type arithmetic: ADDI, ANDI, ORI, SLTI
            7'b0010011: begin
                ResultSrc = 2'b00;
                ALUSrc    = 1'b1;
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                ALUOp     = 2'b10;
            end

            // Load word: LW
            7'b0000011: begin
                ResultSrc = 2'b01;
                ALUSrc    = 1'b1;
                RegWrite  = 1'b1;
                ImmSrc    = 2'b00;
                ALUOp     = 2'b00;
            end

            // Store word: SW
            7'b0100011: begin
                MemWrite  = 1'b1;
                ALUSrc    = 1'b1;
                ImmSrc    = 2'b01;
                ALUOp     = 2'b00;
            end

            // Branch if equal: BEQ
            7'b1100011: begin
                Branch = 1'b1;
                ALUSrc = 1'b0;
                ImmSrc = 2'b10;
                ALUOp  = 2'b01;
            end

            // Jump and link: JAL
            7'b1101111: begin
                ResultSrc = 2'b10;
                RegWrite  = 1'b1;
                Jump      = 1'b1;
                ImmSrc    = 2'b11;
            end

            // Unsupported opcode: safe defaults remain active
            default: begin
            end

        endcase
    end

endmodule

