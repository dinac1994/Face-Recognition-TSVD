function result = tsvd_I(training_tensor, test_photograph)
  
  result = 0;
  mean_image = zeros(size(test_photograph, 1), size(test_photograph, 2));
  
  for i = 1:size(training_tensor, 2)
    mean_image += squeeze(training_tensor(:,i,:));
  endfor
  
  mean_image = mean_image / size(training_tensor, 2);
  
  for i = 1:size(training_tensor, 2)
    training_tensor(:,i,:) -= twist(mean_image);
  endfor

  transform.L = @fft; transform.l = size(training_tensor, 3); transform.inverseL = @ifft;
  [U,S,V] = tsvd(training_tensor, transform, 'full');
  C = tensor_tensor_product(permute(U, [2 1 3]), training_tensor);
  T(:,1,:) = twist(test_photograph - mean_image);
  B = tensor_tensor_product(permute(U, [2 1 3]), T);
  
  min_distance = 0;
  
  for i = 1:size(training_tensor, 2)
    dif_norm = norm(squeeze((B) - C(:,i,:)), 'fro');
    if i == 1
      min_distance = dif_norm;
    endif
    if min_distance > dif_norm
      min_distance = dif_norm;
    endif
  endfor

  if min_distance <= 2000
    result = 1;
  endif
  
endfunction