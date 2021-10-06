function C = twist(A)

  C = zeros(length(A(:,1)), 1, length(A(1,:)));

  for i = 1:length(A(1,:))
    C(:,1,i) = A(:,i);
  end
  
endfunction