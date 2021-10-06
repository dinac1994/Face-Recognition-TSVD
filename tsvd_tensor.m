function [U,S,V] = tsvd_tensor(A)
  
  # TSVD decomposition of a tensor: A = U*S*V^t
  
  [n1,n2,n3] = size(A);
  A = fft(A,[],3);
  transform.L = @fft; transform.l = n3; transform.inverseL = @ifft;
        
  U = zeros(n1,n1,n3);
  S = zeros(n1,n2,n3);
  V = zeros(n2,n2,n3);
        
  halfn3 = ceil((n3+1)/2);
  for i = 1 : halfn3
    [U(:,:,i),S(:,:,i),V(:,:,i)] = svd(A(:,:,i));
  endfor
  for i = halfn3+1 : n3
     U(:,:,i) = conj(U(:,:,n3+2-i));
     V(:,:,i) = conj(V(:,:,n3+2-i));
     S(:,:,i) = S(:,:,n3+2-i);
  endfor
  
  U = ifft(U,[],3);
  S = ifft(S,[],3);
  V = ifft(V,[],3);

endfunction
