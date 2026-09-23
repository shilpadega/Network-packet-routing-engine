module packet_routing_engine (
    input        clk,
    input        reset,
    input        packet_valid,
    input  [7:0] destination,
    input  [7:0] packet_data,

    output reg [1:0] output_port,
    output reg [7:0] routed_data,
    output reg       route_valid
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            output_port <= 2'b00;
            routed_data <= 8'b0;
            route_valid <= 1'b0;
        end
        else begin
            route_valid <= 1'b0;

            if (packet_valid) begin
                routed_data <= packet_data;

                // Routing based on destination address
                if (destination < 8'd64)
                    output_port <= 2'b00;
                else if (destination < 8'd128)
                    output_port <= 2'b01;
                else if (destination < 8'd192)
                    output_port <= 2'b10;
                else
                    output_port <= 2'b11;

                route_valid <= 1'b1;
            end
        end
    end

endmodule