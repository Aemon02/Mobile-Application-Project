from PIL import Image

# Program to hide secret messages in image files

# text = input('Text you want to hide : ')
# image_path = input('Select you picture : ')

def encode(text, image_path):
    # การแปลง ข้อความ เป็น Unicode
    unicode_text = text.encode('utf-8')
    print(unicode_text)

    # การแปลง Unicode เป็น Bits
    bits_text = ''.join(format(byte, '08b') for byte in unicode_text)
    print(bits_text)

    #เปิดไฟล์รูปภาพ
    image = Image.open(image_path)
    # แสดงรายละเอียดของรูปภาพ
    width, height = image.size
    # print("Image format:", image.format)
    # print("Image mode:", image.mode)
    # image.show()

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


# image_path = "encoded_image.png" 
def decode(image_path):
   
    image = Image.open(image_path)# เปิดภาพที่เข้ารหัส

    width, height = image.size

    index = 0
    bits_text = ""

    # วนลูปผ่านแต่ละพิกเซลและดึง LSB ของแต่ละช่อง
    for y in range(height):
        for x in range(width):
            pixel = list(image.getpixel((x, y)))
            for i in range(3):  # 3 channels: Red, Green, Blue
                if index < len(bits_text):
                    bits_text += str(pixel[i] & 1)
                    index += 1
    print("Extracted text:", (bits_text))

    
    if len(bits_text) % 8 != 0: # ตรวจสอบว่าจำนวน bits หาร 8 ลงตัวหรือไม่
        raise ValueError("There was an error.")

    bytes_list = [] # สร้าง list ของ bytes

    
    for i in range(0, len(bits_text), 8): # วนลูปทีละ 8 bits เพื่อแปลงเป็น bytes
        byte = bits_text[i:i + 8]
        byte_value = int(byte, 2)
        bytes_list.append(byte_value.to_bytes(1, 'big'))

    byte_text = b''.join(bytes_list)
    print(byte_text)

    text = byte_text.decode('utf-8') # แปลง bytes เป็น string
    print("hidden message:", text)

encodeText = encode('Hello', 'h10.jpg')
decodeText = decode('encoded_image.png')




def bitsToBytes(bits):
    # ตรวจสอบว่าจำนวน bits หาร 8 ลงตัวหรือไม่
    if len(bits) % 8 != 0:
        raise ValueError("There was an error.")

    # สร้าง list ของ bytes
    bytes_list = []

    # วนลูปทีละ 8 บิตเพื่อแปลงเป็น bytes
    for i in range(0, len(bits), 8):
        byte = bits[i:i + 8]
        byte_value = int(byte, 2)
        bytes_list.append(byte_value.to_bytes(1, 'big'))

    return b''.join(bytes_list)

# bytes_result = bits_to_bytes(extracted_bits)
# print(bytes_result)

# text = bytes_result.decode('utf-8') # แปลง bytes เป็น string
# print("hidden message:", text)