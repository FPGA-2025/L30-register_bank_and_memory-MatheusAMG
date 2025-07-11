module Memory #(
    parameter MEMORY_FILE = "",
    parameter MEMORY_SIZE = 4096
)(
    input  wire        clk,

    input  wire        rd_en_i,    // Indica uma solicitação de leitura
    input  wire        wr_en_i,    // Indica uma solicitação de escrita

    input  wire [31:0] addr_i,     // Endereço
    input  wire [31:0] data_i,     // Dados de entrada (para escrita)
    output wire [31:0] data_o,     // Dados de saída (para leitura)

    output wire        ack_o       // Confirmação da transação
);

reg [31:0] memory [0:MEMORY_SIZE - 1]; // Tamanho da memoria especificado

assign data_o = (rd_en_i) ? memory[addr_i[31:0]] : 32'b0; //31 a 4 em bytes + 4 bits 0 ou seja 16 valores 0 
assign ack_o = 1'b1;

always @(posedge clk) begin
    if (wr_en_i) begin
        memory[addr_i[31:0]] <= data_i;
    end
end

endmodule
