function test_svm()
t1 = 5+4*randn(2,10);
t2 = 20+4*randn(2,10);
X = [t1 t2];
Y = [ones(10,1);-ones(10,1)]
plot(t1(1,:),t1(2,:),'ro');
hold on;
plot(t2(1,:),t2(2,:),'bx');
hold on;
u = svm(X,Y)
a = [-u(1)/u(2),0];
b = [0,-u(1)/u(3)];
plot(a,b);
hold off;
end