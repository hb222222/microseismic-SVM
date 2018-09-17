function u = svm(X,Y)
[K,N] = size(X);
u0 = rand(K+1,1);    %  u = [b,w]
A = -repmat(Y,1,K+1).*[ones(N,1) X'];
b = -ones(N,1);
H = eye(K);
H = [zeros(1,K);H];
H = [zeros(K+1,1) H];
p = zeros(K+1,1);
lb = -10*ones(K+1,1);
rb = 10*ones(K+1,1);
options = optimset;   %Options是用来控制算法的选项参数的向量
options.LargeScale = 'off';
options.Display = 'off';
options.Algorithm = 'interior-point-convex';
[u,~] = quadprog(H,p,A,b,[],[],lb,rb,u0,options);
end