D = [-5 2.5; 2 -1; 10 -5; -12 6]
v = [2 -1];
a = [-2.5; 1; 5; -6];
av = a*v

figure(1);
plot(D(:,1), D(:,2), 'o');
axis([-15 15 -15 15]);
xlabel('Feature 1');
ylabel('Feature 2');
an = [-10 : 0.25 : 10];
hold on;
cmap = jet(length(an));
for i = 1 : length(an)
    plot(an(i)*v(1), an(i)*v(2), '*', 'Color', cmap(i,:));
end