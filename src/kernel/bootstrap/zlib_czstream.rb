class CZstream
    # CZstream is not intended for use outside of the Zlib module

    class_primitive_nobridge 'open_read', 'openRead:errorClass:' 
    class_primitive_nobridge 'open_write', 'openWrite:errorClass:comprLevel:' 

    # def read(length)
    primitive_nobridge 'read', 'read:'

    primitive_nobridge 'read_header', 'header'
    primitive_nobridge 'write_header', 'writeHeader:'
    primitive_nobridge 'at_eof', 'atEnd' 
    primitive_nobridge 'total_out', 'position'
    primitive_nobridge 'close', 'close'
    primitive_nobridge 'flush', 'flush'
    primitive_nobridge 'write', 'write:count:'

end

module Zlib

  ZStream = ::CZstream 

end 
