module ethernet_port_interface
(
		input  wire        clk,                            //        		.clock.clk
		input  wire        reset,                          //             .reset
		
		input  wire [26:0]  control_port_address,     //      				.control_port.address
		input  wire         control_port_read,        //                  .read
		output wire [31:0]  control_port_readdata,    //                  .readdata
		input  wire         control_port_write,       //                  .write
		input  wire [31:0]  control_port_writedata,   //                  .writedata
		output wire         control_port_waitrequest, //                  .waitrequest
		
		input  wire [7:0]  sink_data0,             //           		.sink.data
		output wire        sink_ready0,            //               .ready
		input  wire        sink_valid0,            //               .valid
		input  wire [5:0]  sink_error0,            //               .error
		input  wire        sink_startofpacket0,    //               .startofpacket
		input  wire        sink_endofpacket0,      //               .endofpacket
		
		output wire [7:0]  source_data0,                //       		.source.data
		input  wire        source_ready0,               //             .ready
		output wire        source_valid0,               //             .valid
		output wire        source_error0,               //             .error
		output wire        source_startofpacket0,       //             .startofpacket
		output wire        source_endofpacket0,         //             .endofpacket
		
		input  wire [7:0]  sink_data1,             //           		.sink.data
		output wire        sink_ready1,            //               .ready
		input  wire        sink_valid1,            //               .valid
		input  wire [5:0]  sink_error1,            //               .error
		input  wire        sink_startofpacket1,    //               .startofpacket
		input  wire        sink_endofpacket1,      //               .endofpacket
		
		output wire [7:0]  source_data1,                //       		.source.data
		input  wire        source_ready1,               //             .ready
		output wire        source_valid1,               //             .valid
		output wire        source_error1,               //             .error
		output wire        source_startofpacket1,       //             .startofpacket
		output wire        source_endofpacket1,         //             .endofpacket
		
		input  wire [7:0]  sink_data2,             //           		.sink.data
		output wire        sink_ready2,            //               .ready
		input  wire        sink_valid2,            //               .valid
		input  wire [5:0]  sink_error2,            //               .error
		input  wire        sink_startofpacket2,    //               .startofpacket
		input  wire        sink_endofpacket2,      //               .endofpacket
		
		output wire [7:0]  source_data2,                //       		.source.data
		input  wire        source_ready2,               //             .ready
		output wire        source_valid2,               //             .valid
		output wire        source_error2,               //             .error
		output wire        source_startofpacket2,       //             .startofpacket
		output wire        source_endofpacket2,         //             .endofpacket
		
		input  wire [7:0]  sink_data3,             //          		.sink.data
		output wire        sink_ready3,            //               .ready
		input  wire        sink_valid3,            //               .valid
		input  wire [5:0]  sink_error3,            //               .error
		input  wire        sink_startofpacket3,    //               .startofpacket
		input  wire        sink_endofpacket3,      //               .endofpacket
		
		output wire [7:0]  source_data3,                //       		.source.data
		input  wire        source_ready3,               //             .ready
		output wire        source_valid3,               //             .valid
		output wire        source_error3,               //             .error
		output wire        source_startofpacket3,       //             .startofpacket
		output wire        source_endofpacket3,         //             .endofpacket
		
		output  wire			txs_chip_select,
		output  wire			txs_read,
		output  wire 			txs_write,
		output  wire [31:0]	txs_address,
		output  wire [9:0]	txs_burst_count,
		output  wire [31:0]	txs_writedata,
		output  wire [3:0]	txs_byteenable,
		input 	wire 			txs_read_valid,
		input 	wire [31:0]	txs_readdata,
		input 	wire 			txs_wait_request,
		
		input wire 			user_sw,
		
		input 	wire 			rxm_read_bar_0_1,
		input 	wire     	rxm_write_bar_0_1,
		input 	wire [26:0] rxm_address_bar_0_1,
		input 	wire [31:0]	rxm_writedata_bar_0_1,
		output  wire 			rxm_wait_request_bar_0_1,
		output  wire [31:0] 	rxm_readdata_bar_0_1,
		output  wire 			rxm_read_valid_bar_0_1,
		
		
		input 	wire 			rxm_read_bar_1,
		input 	wire     	rxm_write_bar_1,
		input 	wire [26:0] rxm_address_bar_1,
		input 	wire [31:0]	rxm_writedata_bar_1,
		output  wire 			rxm_wait_request_bar_1,
		output  wire [31:0] 	rxm_readdata_bar_1,
		output  wire 			rxm_read_valid_bar_1,
		
		output	wire 			rxm_read_bar_1_out,
		output	wire     	rxm_write_bar_1_out,
		output	wire [31:0] rxm_address_bar_1_out,
		output	wire [31:0] rxm_writedata_bar_1_out,
		input 	wire 			rxm_wait_request_bar_1_in,
		input  	wire [31:0] rxm_readdata_bar_1_in,
		input 	wire 	    	rxm_read_valid_bar_1_in
		
);

		
		wire [28:0]		rxm_address_bar_1_out_shift;
		wire [26:0] 	MM_port_address;
		wire 				MM_port_read;
		wire [31:0] 	MM_port_readdata;
		wire 				MM_port_write;
		wire [31:0]		MM_port_writedata;
		wire 				MM_port_waitrequest;
		wire 				MM_port_readdata_valid;	
		wire [28:0] 	control_port_address_rxm_shift;	
		wire [31:0] 	rxm_port_readdata;
		
		
		assign rxm_address_bar_1_out_shift 							= (rxm_address_bar_1 << 2);
		assign rxm_read_bar_1_out 										= rxm_read_bar_1;
		assign rxm_write_bar_1_out 									= rxm_write_bar_1;
		assign rxm_address_bar_1_out 									= ({1'b1,2'b00,rxm_address_bar_1_out_shift[28:4],2'b00});
		assign rxm_writedata_bar_1_out 								= rxm_writedata_bar_1;
		assign rxm_wait_request_bar_1 								= rxm_wait_request_bar_1_in;
		assign rxm_readdata_bar_1 										= rxm_readdata_bar_1_in;
		assign rxm_read_valid_bar_1 									= rxm_read_valid_bar_1_in;
		assign control_port_address_rxm_shift 						= (rxm_address_bar_0_1 << 2);	
		
		assign MM_port_address 											= (user_sw)?(control_port_address):({control_port_address_rxm_shift[28:4],2'b00});
		assign MM_port_read 												= (user_sw)?control_port_read:rxm_read_bar_0_1;
		assign MM_port_write 											= (user_sw)?control_port_write:rxm_write_bar_0_1;
		assign MM_port_writedata 										= (user_sw)?control_port_writedata:rxm_writedata_bar_0_1;
		
		assign  control_port_readdata 								= MM_port_readdata;
		assign  control_port_waitrequest 							= MM_port_waitrequest;
		
		assign rxm_readdata_bar_0_1 									= (user_sw)?32'b0:rxm_port_readdata;
		assign rxm_read_valid_bar_0_1 								= (user_sw)?1'b0:MM_port_readdata_valid;
		assign rxm_wait_request_bar_0_1 								= (user_sw)?1'b0:MM_port_waitrequest;
	
	

		
		
	nf2_core nf2_core
   (
	
		// JTAG Interface
		
		.control_port_address(MM_port_address),   
		.control_port_read(MM_port_read),       
		.control_port_readdata(MM_port_readdata),    
		.control_port_write(MM_port_write),      
		.control_port_writedata(MM_port_writedata),  
		.control_port_waitrequest(MM_port_waitrequest), 
		.control_port_read_datavalid(MM_port_readdata_valid),
		.rxm_port_readdata(rxm_port_readdata),
	
		.gmac_tx_data_1_out(source_data1),
		.gmac_tx_dvld_1_out(source_valid1),
		.gmac_tx_ack_1_out(source_ready1),
		.end_of_packet_1_out(source_endofpacket1),
		.start_of_packet_1_out(source_startofpacket1),
		  
		.gmac_rx_data_1_in(sink_data1),
		.gmac_rx_dvld_1_in(sink_valid1),
		.gmac_rx_frame_error_1_in(sink_error1_in), 
		
		.gmac_tx_data_2_out(source_data2),
		.gmac_tx_dvld_2_out(source_valid2),
		.gmac_tx_ack_2_out(source_ready2),
		.end_of_packet_2_out(source_endofpacket2),
		.start_of_packet_2_out(source_startofpacket2),
		  
		.gmac_rx_data_2_in(sink_data2),
		.gmac_rx_dvld_2_in(sink_valid2),
		.gmac_rx_frame_error_2_in(sink_error2_in),
		
		.gmac_tx_data_3_out(source_data3),
		.gmac_tx_dvld_3_out(source_valid3),
		.gmac_tx_ack_3_out(source_ready3),
		.end_of_packet_3_out(source_endofpacket3),
		.start_of_packet_3_out(source_startofpacket3),
		  
		.gmac_rx_data_3_in(sink_data3),
		.gmac_rx_dvld_3_in(sink_valid3),
		.gmac_rx_frame_error_3_in(sink_error3_in), 
		
		.gmac_tx_data_0_out(source_data0),
		.gmac_tx_dvld_0_out(source_valid0),
		.gmac_tx_ack_0_out(source_ready0),
		.end_of_packet_0_out(source_endofpacket0),
		.start_of_packet_0_out(source_startofpacket0),
		  
		.gmac_rx_data_0_in(sink_data0),
		.gmac_rx_dvld_0_in(sink_valid0),
		.gmac_rx_frame_error_0_in(sink_error0_in), 

      .core_clk_int(clk),
      .reset(reset)    

   );
	
	reg sink_error0_in_reg,sink_error1_in_reg,sink_error2_in_reg,sink_error3_in_reg;
	
	always@ (*) begin
		if(sink_error0 == 6'b0)begin
			sink_error0_in_reg = 1'b0;
		end
		else begin
			sink_error0_in_reg = 1'b1;
		end
	end
	always@(*) begin
		if(sink_error1 == 6'b0)begin
			sink_error1_in_reg = 1'b0;
		end
		else begin
			sink_error1_in_reg = 1'b1;
		end
	end
		always@(*) begin
		if(sink_error2 == 6'b0)begin
			sink_error2_in_reg = 1'b0;
		end
		else begin
			sink_error2_in_reg = 1'b1;
		end
	end
		always@(*) begin
		if(sink_error3 == 6'b0)begin
			sink_error3_in_reg = 1'b0;
		end
		else begin
			sink_error3_in_reg = 1'b1;
		end
	end
	
	assign sink_error0_in = sink_error0_in_reg;
	assign sink_error1_in = sink_error1_in_reg;
	assign sink_error2_in = sink_error2_in_reg;
	assign sink_error3_in = sink_error3_in_reg;

		assign source_error0 = 1'b0;
	   assign source_error1 = 1'b0;
		assign source_error2 = 1'b0;
		assign source_error3 = 1'b0;
		
		
reg sink_ready0_reg;
reg sink_ready1_reg;
reg sink_ready2_reg;
reg sink_ready3_reg;

		always @(posedge clk) begin
			if (reset) begin
				sink_ready0_reg = 1'b0;

			end
			else begin
			 sink_ready0_reg = 1'b1;
			 end
		end
		
		always @(posedge clk) begin
			if (reset) begin
				sink_ready1_reg = 1'b0;

			end
			else begin
			 sink_ready1_reg = 1'b1;
			 end
		end	
		
		always @(posedge clk) begin
			if (reset) begin
				sink_ready2_reg = 1'b0;

			end
			else begin
			 sink_ready2_reg = 1'b1;
			 end
		end
		
		always @(posedge clk) begin
			if (reset) begin
				sink_ready3_reg = 1'b0;

			end
			else begin
			 sink_ready3_reg = 1'b1;
			 end
		end
	
assign sink_ready0 = sink_ready0_reg;
assign sink_ready1 = sink_ready1_reg;
assign sink_ready2 = sink_ready2_reg;
assign sink_ready3 = sink_ready3_reg;	

endmodule		