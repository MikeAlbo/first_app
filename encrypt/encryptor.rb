class Encryptor
    def cipher(rotation)
        characters = (' '..'z').to_a
        rotated_characters = characters.rotate(rotation)
        Hash[characters.zip(rotated_characters)]
        
        end
    def encrypt_letter(letter,rotation)
        cipher_for_rotation = cipher(rotation)
        cipher_for_rotation[letter]
        end
    
   def encrypt(string, rotation)

  letters = string.split("")

 
  results = letters.collect do |letter|
    encrypted_letter = encrypt_letter(letter, rotation)
    
  end

 
  results.join
end

def decipher(rotation)
    decipher_rotation = rotation * -1
    characters = (' '..'z').to_a
    derotated_characters = characters.rotate(decipher_rotation)
    Hash[characters.zip(derotated_characters)]
    
    end
def decrypt_letters(letter, rotation)
    decipher_for_rotation = decipher(rotation)
    decipher_for_rotation[letter]
    end

def decrypt(string, rotation)
    
    letters = string.split("")
    results = letters.collect do |letter|
        decrypted_letters = decrypt_letters(letter, rotation)
        end
    results.join
    end

def encrypt_file(filename, rotation)
    # Create the file handle to the input file
    
    input = File.open(filename, "r")
    
    # Read the text of the input file
    msg = input.read
    #Encrpyt the text
     out_msg = encrypt(msg, rotation)
    #Create a name for the output file
    out_message_name = "e_" + filename
    #Create an output file handle
    out = File.open(out_message_name, "w")
    #Write out the text
    out.write(out_msg)
    
    #Close the file
    out.close
    end

def decrypt_file(filename, rotation)
    #Create a file handle to the encrypted file
    input = File.open(filename, "r")
    #read the encrypted file
    encrypted_message = input.read
    #decrpyt the text by passing in the text and rotation
    decrypted_message = decrypt(encrypted_message, rotation)
    #create the name for the decrypted file
    decrypted_message_name = filename.gsub("e_","d_")
    #create an output file handle
    out = File.open(decrypted_message_name, "w")
    #write out the text
    out.write(decrypted_message)
    #close the file
    out.close
    end

end
