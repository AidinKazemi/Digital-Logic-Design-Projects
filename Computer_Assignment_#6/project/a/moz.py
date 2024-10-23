def float_to_bin(f):
    # Convert a floating-point number to its IEEE 754 binary representation
    return bin(int.from_bytes((f).to_bytes(4, byteorder='big', signed=False), byteorder='big'))[2:].zfill(32)

def generate_hex_file(filename):
    with open(filename, 'w') as file:
        for i in range(16):
            cell_value = 1 / (i + 1)
            bin_representation = float_to_bin(cell_value)
            hex_value = hex(int(bin_representation, 2))[2:].zfill(4)
            file.write(hex_value + '\n')

if __name__ == "__main__":
    generate_hex_file("output.hex")