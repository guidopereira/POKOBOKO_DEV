/*
**  Usage:
**      rc4(str,key)
**
**  Arguments:
**      str     plaintext or ciphertext, string
**      key     encryption key, string
**
**  Returns:
**      the given string encrypted/decrypted with the given key
**
**  Notes:
**      RC4 is a trademark owned by RSA Data Security, Inc.
**      ARC4 and ARCFOUR are generic names for the algorithm.
**
**  GMLscripts.com
*/
{
    var str,key,out,len,i,S,j,temp,pos,t;
    str = argument0;
    key = argument1;
    out = "";
    len = string_length(key);
    for (i=0; i<256; i+=1) S[i] = i;
    j = 0;
    for (i=0; i<256; i+=1) {
        j = (j + S[i] + ord(string_char_at(key,(i mod len)+1))) mod 256;
        temp = S[i];
        S[i] = S[j];
        S[j] = temp;
    }
    i = 0;
    j = 0;
    for (pos=0; pos<string_length(str); pos+=1) {
        i = (i + 1) mod 256;
        j = (j + S[i]) mod 256;
        temp = S[i];
        S[i] = S[j];
        S[j] = temp;
        t = (S[i] + S[j]) mod 256;
        out += chr(ord(string_char_at(str,pos+1)) ^ S[t]);
    }
    return out;
}
