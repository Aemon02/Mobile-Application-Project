from PIL import Image

def encode(text, image_path):
    # การแปลงข้อความเป็น Unicode
    unicode_text = text.encode('utf-8')
    print("Text length:", (unicode_text))  # พิมพ์ความยาวข้อความ (ในบิต)

    # การแปลง Unicode เป็น Bits
    bits_text = ''.join(format(byte, '08b') for byte in unicode_text)
    print("Bits text from encode step1:", len(bits_text) , '= ', bits_text)

    if bits_text[0] == 1:
        bits_text = (str(0)* len(bits_text)) + str(bits_text)
    else:
        bits_text = (str(1)* len(bits_text)) + str(bits_text)
    print("Bits text from encode step2:", len(bits_text) , '= ', bits_text)

    # เปิดไฟล์รูปภาพ
    image = Image.open(image_path)
    # แสดงรายละเอียดของรูปภาพ
    width, height = image.size

    # วนลูปผ่านแต่ละพิกเซลและซ่อนข้อความใน LSB
    index = 0
    for y in range(height):
        for x in range(width):
            pixel = list(image.getpixel((x, y)))
            for i in range(3):  # 3 channels: Red, Green, Blue
                if index < len(bits_text):
                    bit = bits_text[index]
                    pixel[i] = pixel[i] & ~1 | int(bit)
                    index += 1
            image.putpixel((x, y), tuple(pixel))

    image.save("encoded_image.png")
# ทดสอบ
encode("สวัสดี;", "h10.jpg")

def decode(image_path):
    image = Image.open(image_path)
    width, height = image.size

    bits_num = ''
    bits_text = ''

    index_num = 0
    index_text = 0

    bits = ''

    for y in range(height):
        for x in range(width):
            pixel = list(image.getpixel((x, y)))
            for i in range(3):  # 3 channels: Red, Green, Blue
                bits += str(pixel[i] & 1) 
                index_num += 1 
                if index_num % 8 == 0:    
                    if bits_num == '' or bits == bits_num[:8]: # bits == bits_num[:8] คือ การเปรียบเทียบ set bits ที่เข้ามาใหม่กับ bits ที่มีอยู่ก่อนหน้าใน bits_num ตำแหน่ง 1-8
                        # print('index_num',index_num, bits_num[:8])
                        bits_num += bits[:8]
                        bits = '' 
                        # print('current_bit_group:',bits)

    print("Bits num from decode:", len(bits_num), '= ', bits_num)        

    for y in range(height):
        for x in range(width):
            pixel = list(image.getpixel((x, y)))
            for i in range(3):  # 3 channels: Red, Green, Blue
                if index_text < len(bits_num)*2:
                    bits_text += str(pixel[i] & 1)
                    index_text += 1         
    print("Bits num + text from decode:", len(bits_text), '= ', bits_text)                
    
    first_bits = int(len(bits_text)/2)
    print("Bits text from decode:",first_bits, '= ', bits_text[first_bits:])  

    bits_text = bits_text[first_bits:]

    bytes_list = []
    for i in range(0, len(bits_text), 8): # วนลูปทีละ 8 bits เพื่อแปลงเป็น bytes
        byte = bits_text[i:i + 8]
        byte_value = int(byte, 2)
        bytes_list.append(byte_value.to_bytes(1, 'big'))

    byte_text = b''.join(bytes_list)
    # print(byte_text)
    

    text = byte_text.decode('utf-8') #  bytes to string
    print("hidden message:", text)

decodeText = decode('encoded_image.png')