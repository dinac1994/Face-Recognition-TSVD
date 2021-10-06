function C = tensor_tensor_product(A, B)
  
    [n1, n2, n3] = size(A);
    [m1, m2, m3] = size(B);
    A = fft(A, [], 3);
    B = fft(B, [], 3);
    
    halfn3 = ceil((n3+1)/2);
    
    for i = 1 : halfn3
        C(:,:,i) = A(:,:,i) * B(:,:,i);
    end
    for i = halfn3+1 : n3
        C(:,:,i) = conj(C(:,:,n3+2-i));
    end
    
    C = ifft(C, [], 3);
endfunction