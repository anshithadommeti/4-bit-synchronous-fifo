module fifo_tb;
  
  reg clk;
  reg reset;
  reg write_en;
  reg read_en;
  reg [3:0]data_in;
  
  wire [3:0]data_out;
  wire empty;
  wire full;
  
  fifo_4bit DUT(.clk(clk),.reset(reset),.write_en(write_en),.read_en(read_en),
            .data_in(data_in),.data_out(data_out),.empty(empty),.full(full));
  always #5 clk=~clk;
  initial begin
    $dumpfile("fifo_waveform.vcd");
    $dumpvars(0,fifo_tb);
    $monitor("Time=%0t | Write=%b | Read=%b | Data_in=%b | Data_out=%b |    Full=%b | Empty=%b | Count=%d",
     $time, write_en, read_en, data_in, data_out, full, empty, DUT.count); 

        // Initial values
        clk = 0;
        reset = 1;
        write_en = 0;
        read_en = 0;
        data_in = 4'b0000;

        #10;
        reset = 0;

        write_en = 1;
        data_in = 4'b1010;
        #10;

        data_in = 4'b0110;
        #10;

        
        data_in = 4'b1100;
        #10;

        
        data_in = 4'b1111;
        #10;

        
        write_en = 0;
        #10;

       
        read_en = 1;
        #10;

        // READ 0110
        #10;

        // READ 1100
        #10;

        // READ 1111
        #10;

        // Stop reading
        read_en = 0;
        #10;

        $finish;

    end

endmodule
             