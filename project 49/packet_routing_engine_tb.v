`timescale 1ns/1ps

module packet_routing_engine_tb;

    reg        clk;
    reg        reset;
    reg        packet_valid;
    reg [7:0]  destination;
    reg [7:0]  packet_data;

    wire [1:0] output_port;
    wire [7:0] routed_data;
    wire       route_valid;

    packet_routing_engine uut (
        .clk(clk),
        .reset(reset),
        .packet_valid(packet_valid),
        .destination(destination),
        .packet_data(packet_data),
        .output_port(output_port),
        .routed_data(routed_data),
        .route_valid(route_valid)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor("Time=%0t | Destination=%d | Packet=%h | Output Port=%b | Routed Data=%h | Valid=%b",
                 $time, destination, packet_data,
                 output_port, routed_data, route_valid);

        clk = 0;
        reset = 1;
        packet_valid = 0;
        destination = 0;
        packet_data = 0;

        #10;
        reset = 0;

        // Packet 1: Destination 20 -> Port 0
        #10;
        destination = 8'd20;
        packet_data = 8'hA1;
        packet_valid = 1;

        #10;
        packet_valid = 0;

        // Packet 2: Destination 80 -> Port 1
        #10;
        destination = 8'd80;
        packet_data = 8'hB2;
        packet_valid = 1;

        #10;
        packet_valid = 0;

        // Packet 3: Destination 150 -> Port 2
        #10;
        destination = 8'd150;
        packet_data = 8'hC3;
        packet_valid = 1;

        #10;
        packet_valid = 0;

        // Packet 4: Destination 220 -> Port 3
        #10;
        destination = 8'd220;
        packet_data = 8'hD4;
        packet_valid = 1;

        #10;
        packet_valid = 0;

        #10;
        $finish;
    end

endmodule