__kernel void hashBuild(__global unsigned int *input, __global unsigned int *result, unsigned int inputArrSize) {
    
    size_t inpOffset = (inputArrSize/32) * get_global_id(0);
        size_t outOffset = (inputArrSize/32) * get_global_id(0);
        for(unsigned int i=0; i < (inputArrSize/32); i++){
            unsigned int hf = ((input[inpOffset + i]) % (inputArrSize/32)) + outOffset;
                for(unsigned int j=0; j < (inputArrSize/32); j++){
                    if(result[hf] > 0){
                        hf += 1;
                    }else{
                    
                        result[hf] = input[inpOffset + i];
                        break;
                    }
                }
        }

  
}