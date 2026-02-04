
typedef enum bit { GOOD_PARITY,BAD_PARITY } parity_type_e;
class yapp_packet extends uvm_sequence_item;


rand bit [1:0] addr;
rand bit [5:0] length;
bit [7:0] parity;
rand bit [7:0] payload [];
rand parity_type_e parity_type;
rand int packet_delay;

constraint valid_addr {addr!=2'b11;}
constraint valid_pkt_length {length>1;length<64;}
constraint valid_payload_size {length==payload.size();}
constraint valid_parity_type {parity_type dist {GOOD_PARITY:=5,BAD_PARITY:=1};}
constraint valid_packet_delay {packet_delay>1;packet_delay<20;}

`uvm_object_utils_begin(yapp_packet)

`uvm_field_int(addr,UVM_ALL_ON)
`uvm_field_int(length,UVM_ALL_ON)
`uvm_field_int(parity,UVM_ALL_ON)
`uvm_field_array_int(payload,UVM_ALL_ON)
`uvm_field_enum(parity_type_e, parity_type, UVM_ALL_ON)
`uvm_field_int(packet_delay, UVM_ALL_ON | UVM_DEC | UVM_NOCOMPARE)

`uvm_object_utils_end


function new(string name="yapp_packet");
  super.new(name);
endfunction


function bit [7:0] calc_parity();
calc_parity ={length,addr};
foreach (payload[i]) begin
  calc_parity=calc_parity^payload[i];
end
endfunction:calc_parity

function void set_parity();
if (parity_type==GOOD_PARITY)
parity=calc_parity();
else begin
  parity++;
end
endfunction:set_parity

function void post_randomize();
set_parity();
endfunction:post_randomize


endclass: yapp_packet
