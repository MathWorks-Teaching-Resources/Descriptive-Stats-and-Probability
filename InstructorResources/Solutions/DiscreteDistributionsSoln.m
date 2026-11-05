%[text] %[text:anchor:T_8835A790] # Discrete Random Variables
%[text] ***Author***: Ward Nickle, Humboldt State University
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
%[text] This live script is intended to be used with the code visible and output inline. On the **View** tab of the MATLAB Toolstrip, in the **View** section, select **Output Inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:33ab) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:3d02) Interacting with this live script will build some familiarity with MATLAB as concepts and commands are introduced together. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2-hour online tutorial that teaches the essentials of MATLAB.
%[text] ![Warning symbol](text:image:80f8)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and they will generate errors if run out of order.
%[text] The ![Try this icon](text:image:1866) icon refers to an interactive activity that you will find in this script. 
%%
%[text] %[text:anchor:H_6234F962] ## Probability Distributions
%[text] A probability distribution is a table of values that describes every possible value of the random variable and its associated likelihood. Of course, these tables are often equivalently represented by graphs. They are very similar to relative frequency distributions in that, once an experiment is repeated enough times, the empirical probabilities approach the theoretical ones. So, relative frequency distributions with a large enough sample size can be thought of as probability distributions.
%[text] Coins, dice, and playing cards are commonly used to describe discrete random variables and their associated probability distributions. For example, if we consider the number of heads in 2 coin tosses, there are a fixed number of possible outcomes and a probability for each. There can only be 0, 1, or 2 heads in 2 coin tosses. The outcomes are as follows. 
%[text]{"align":"center"} ![Table presenting the four possible outcomes: Heads/Heads, Heads/Tails, Tails/Heads, and Tails/Tails with two coin tosses](text:image:788d) 
%[text] Now if we consider the probabilities associated with each value of the random variable, number of heads, we see that they occur with the following relative frequencies, which are probabilities.
%[text]{"align":"center"} ![Table showing that for a number of heads, x, the probability P(x) is: P(0) = 1/4 and P(1) = 2/4 and P(2) = 1/4](text:image:1508)
%[text] That is, out of 4 possible outcomes, there is only 1 way to get no heads or both heads, and there are 2 ways to get 1 head. When held relative to the total number of possible outcomes, these counts inform the probability of each particular outcome, P(x). The values of the random variable are mutually exclusive and collectively exhaustive in that the values do not overlap and consider every possibility. Therefore, the probabilities must always add to 1, or 100%, in the sense that every possible outcome has been considered.
%%
%[text] %[text:anchor:H_37DEF139] ## Statistics
%[text] Descriptive statistics for discrete random variables are found in a way analogous to finding a weighted mean. The probability of x, P(x), is essentially the weight for each x. Since the sum of the probabilities is 1, we have the following formula for the mean.
%[text]{"align":"center"} $\\mu =\\sum\_{i=1}^n \\left(x\_i P\\left(x\_i \\right)\\right)${"editStyle":"visual"} 
%[text] The variance, and its square root, the standard deviation, are found in a similar manner.
%[text]{"align":"center"}  $\\sigma^2 =\\sum\_{i=1}^n \\left\\lbrack {\\left(x\_i -\\mu \\right)}^2 P\\left(x\_i \\right)\\right\\rbrack${"editStyle":"visual"} $\\sigma =\\sqrt{\\sum\_{i=1}^n \\left\\lbrack {\\left(x\_i -\\mu \\right)}^2 P\\left(x\_i \\right)\\right\\rbrack }${"editStyle":"visual"} 
%%
%[text] %[text:anchor:H_7DF8634F] ## Binomial Distributions
%[text] The coin toss example considered above is an example of a binomial experiment. As the name implies, there are 2 possible outcomes in a binomial experiment. Other common examples include true or false, yes or no, and success or failure. As with all random variables, these outcomes must be mutually exclusive. Additionally, there must be a fixed number of trials, or repetitions, of the experiment. The probability between trials must be invariant, and the trials must be independent of one another. If these conditions are met, then the probability of a particular number of successes (or failures) can be found using counting principles and the multiplication rule for probability, which lead to the following formula.
%[text]{"align":"center"}  $P\\left(X=x\\right)=\_n^{\\;} C\_x^{\\;} \\;\\pi^x {\\left(1-\\pi \\right)}^{n-x}${"editStyle":"visual"}
%[text] Here $C${"editStyle":"visual"} is combination, $n${"editStyle":"visual"} is the number of trials, $x${"editStyle":"visual"} is the number of successes, and $\\pi${"editStyle":"visual"} is the probability of success. Therefore, $\\left(1-\\pi \\right)${"editStyle":"visual"} is the probability of failure. If in $n${"editStyle":"visual"} trials there are $x${"editStyle":"visual"} successes, then there are $n-x${"editStyle":"visual"} failures. So there are $\_n^{\\;} C\_x^{\\;}${"editStyle":"visual"} ways of distributing $x${"editStyle":"visual"} successes in $n${"editStyle":"visual"} trials, times the probability of success raised to the number of successes, times the probability of failure raised to the number of failures.
%[text] The mean, variance, and the standard deviation can be found more concisely than by using the formulas previously given for discrete random variables.
%[text]{"align":"center"} $\\mu =n\\pi${"editStyle":"visual"} $\\sigma^2 =n\\pi \\left(1-\\pi \\right)${"editStyle":"visual"} $\\sigma =\\sqrt{n\\pi \\left(1-\\pi \\right)}${"editStyle":"visual"}
%[text] **Example**
%[text] Suppose 40% of insured motorists file a claim each year. If 15 insured motorists are selected at random, how many would you expect to have filed a claim within the last year? The expected value is just the mean, so we would write
15*0.4
%[text] What is the probability that 10 insured motorists filed a claim within the last year? Here we should use the binomial probability density function (pdf), [`y = binopdf(x,n,p)`](https://www.mathworks.com/help/stats/binopdf.html#d120e113264)`.`
binopdf(10,15,0.4)
%[text] What is the probability that 10 or more of the insured motorists filed a claim last year? The question is asking for $P\\left(X\\ge 10\\right)${"editStyle":"visual"},so we could add the separate probabilities.
x = 10:15;
y = binopdf(x,15,0.4);
sum(y)
%[text] It would be simpler to use the complement rule and the binomial cumulative distribution function, [`y = binocdf(x,n,p)`](https://www.mathworks.com/help/stats/binocdf.html#d120e112597)`,` which finds $P\\left(X\\le x\\right)${"editStyle":"visual"}.  So, the $P\\left(X\\ge 10\\right)=1-P\\left(X\<9\\right)${"editStyle":"visual"}.
1 - binocdf(9,15,0.4)
%[text] Finally, we could use the cdf with the optional 'upper' argument, which, as the name implies, finds the upper tail probability, or $P\\left(X\>x\\right)${"editStyle":"visual"}. We have to be careful with boundaries, as the $P\\left(X\>9\\right)=P\\left(X\\ge 10\\right)${"editStyle":"visual"}.
binocdf(9,15,0.4,'upper')
%[text] ![Try this icon](text:image:9b60) **Task**
%[text] The helper function `plotBinomDist` draws the probability density function (pdf) and displays $P\\left(a\\le X\\le b\\right)${"editStyle":"visual"} for a binomial random variable. The number of trials, *n*, must be a natural number. The bounds on *x*, *a* and *b*, must be natural numbers where $a\\le b${"editStyle":"visual"}. The probability, *p*, like all probabilities, must be between 0 and 1. Labels are shown for each probability when $n\\le 20${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:34de]{"position":[1,2]}
n = 15;  % number of trials %[control:editfield:4f41]{"position":[5,7]}
p = 0.4;  % probability of success %[control:editfield:1820]{"position":[5,8]}
a = 10;  % min number of successes %[control:editfield:7ddc]{"position":[5,7]}
b = 15;  % max number of successes %[control:editfield:7dce]{"position":[5,7]}
PlotBinomDist(n,p,a,b)
%%
%[text] %[text:anchor:H_CCC79299] ## Hypergeometric Distributions
%[text] If the fixed trials of an experiment with 2 outcomes are not independent, then we use the hypergeometric distribution. This often occurs when the sampling is done without replacement, which changes the probability for a particular outcome from trial to trial. As is often the case with small, finite populations sampled without replacement, one should appeal to the hypergeometric distribution. For example, a 6-number lottery that is drawn from the numbers 1 to 49 without replacement, the number of men on a committee from a distinct group, and the number of hearts in hand of poker, all have hypergeometric distributions.
%[text]{"align":"center"} $P\\left(X=x\\right)=\\frac{\\left(\_K^{\\;} C\_x^{\\;} \\right)\\left(\_{M-K}^{\\;} C\_{N-x}^{\\;} \\right)}{\_M^{\\;} C\_N^{\\;} }${"editStyle":"visual"}
%[text] Here there are *x* successes in the sample, *K* successes in the population, *M* is the population size, and *N* is the sample size. So we are saying there are $\_K^{\\;} C\_x^{\\;}${"editStyle":"visual"} ways to distribute the successes, $\_{M-K}^{\\;} C\_{N-x}^{\\;}${"editStyle":"visual"} ways to distribute the failures, and $\_M^{\\;} C\_N^{\\;}${"editStyle":"visual"} ways to distribute the samples of size *N*.
%[text] **Example**
%[text] Suppose a committee is being formed from a group of 12 people, 4 of whom are members of a minority. What is the likelihood that a randomly selected committee of four people has no members of a minority? Because the population is finite and the sampling is done without replacement, we use the hypergeometric probability density function (pdf), [`y = hygepdf(X,M,K,N).`](https://www.mathworks.com/help/stats/hygepdf.html)
hygepdf(0,12,4,4)
%[text] What is the probability that at most half of the committee are members of a minority. Since *N* is 4, we are seeking $P\\left(X\\le 2\\right)${"editStyle":"visual"}. If we use the pdf, we need to add.
x = 0:2;
y = hygepdf(x,12,4,4);
sum(y)
%[text] Alternatively, we could use the hypergeometric cumulative distribution function, [`y = hygecdf(x,M,K,N)`](https://www.mathworks.com/help/stats/hygecdf.html), which returns $P\\left(X\\le x\\right)${"editStyle":"visual"}.
hygecdf(2,12,4,4)
%[text] ![Try this icon](text:image:1c35) **Task**
%[text] The helper function `plotHypgeomDist` draws the probability density function (pdf) and displays $P\\left(a\\le X\\le b\\right)${"editStyle":"visual"} for a hypergeometric random variable. All values must be natural numbers where $n\\le N${"editStyle":"visual"} and $S\\le N${"editStyle":"visual"}, as neither the sample size, *n*, nor the number of successes in the population, *S*, can exceed the population size, *N*. The bounds on *x*, *a* and *b*, must be natural numbers where $a\\le b${"editStyle":"visual"}.  Labels are shown for each probability when $n\\le 20${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:0170]{"position":[1,2]}
N = 4;  % N sample size %[control:editfield:12f3]{"position":[5,6]}
M = 12;  % M population size %[control:editfield:0b46]{"position":[5,7]}
K = 4;  % K successes in the population %[control:editfield:51f7]{"position":[5,6]}
a = 0;  % min number of successes %[control:editfield:3392]{"position":[5,6]}
b = 2;  % max number of successes %[control:editfield:92e6]{"position":[5,6]}
PlotHypgeomDist(N,M,K,a,b)
%%
%[text] %[text:anchor:H_AB37C69E] ## Poisson Distributions
%[text] Finally, when considering the number of times an event occurs over a continuous interval, as opposed to a fixed number of trials, then we employ the Poisson distribution. The interval over which the counting of the event occurs is continuous, such as distance, area, volume, or time. The number of errors per page, the pieces of mail received per day, and the number of calls received per week, are examples of Poisson random variables. The probability of *x* successes in a given interval is given by
%[text]{"align":"center"} $P\\left(X=x\\right)=\\frac{\\lambda^x e^{-\\lambda } }{x!}${"editStyle":"visual"}
%[text] where $\\lambda${"editStyle":"visual"} is the mean number of success per interval and $e\\approx 2\\ldotp 71828${"editStyle":"visual"}, the base of the natural logarithm.
%[text] **Example**
%[text] Suppose it is known that there is 1 defaulted loan per month at a local bank. What is the probability that 3 loans will be defaulted in a given month? To answer this question, we can use the Poisson probability density function (pdf), [`y = poisspdf(x,lambda)`](https://www.mathworks.com/help/stats/poisspdf.html#d120e555235)`.`
poisspdf(3,1)
%[text] What is the probability that *at least* 3 loans will be defaulted, or, what is $P\\left(X\\ge 3\\right)${"editStyle":"visual"}? We could answer this question several ways. We could use the above function for several values of *x* and sum them. Since the probability becomes 0 for large values of *x*, it is sufficient to allow *x* to be as large as 20.
x = 3:20;
y = poisspdf(x,1);
sum(y)
%[text] It would be more efficient, however, to use the complement, that is, $P\\left(X\\ge 3\\right)=1-P\\left(X\<3\\right)=1-P\\left(X\\le 2\\right)${"editStyle":"visual"}. With the pdf, we could then write
x = 0:2;
y = poisspdf(x,1);
1-sum(y)
%[text] It would be simpler still to use the Poisson cumulative distribution function, [`y = poisscdf(x,lambda)`](https://www.mathworks.com/help/stats/poisscdf.html#d120e554765)`, which finds` $P\\left(X\\le x\\right)${"editStyle":"visual"}.
1 - poisscdf(2,1)
%[text] Lastly, instead of using the complement, we could add the argument 'upper' to the cdf and find $P\\left(X\>x\\right)${"editStyle":"visual"}.
poisscdf(2,1,'upper')
%[text] ![Try this icon](text:image:07e4) **Task**
%[text] The helper function `plotPoissonDist` draws the probability density function (pdf) and displays $P\\left(a\\le X\\le b\\right)${"editStyle":"visual"} for a Poisson random variable. The number of trials, *n*, the mean number of successes per interval, $\\lambda${"editStyle":"visual"}, and the bounds on *x*, *a* and *b*, must all be natural numbers. Also note that $a\\le b${"editStyle":"visual"}. Labels are shown for each probability when $n\\le 20${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:4a2d]{"position":[1,2]}
n = 3;  % number of successes per interval %[control:editfield:5f24]{"position":[5,6]}
l = 1;  % mean successes per interval, lambda %[control:editfield:21d3]{"position":[5,6]}
a = 3;  % min number of successes per interval %[control:editfield:6256]{"position":[5,6]}
b = 3;  % max number of successes per interval %[control:editfield:75b2]{"position":[5,6]}
PlotPoissonDist(n,l,a,b)
%%
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] %[text:anchor:H_B4346C3E] ## Helper Functions
%[text] These functions plot the different distributions discussing in this script given their defining parameters and an interval of values.
function PlotBinomDist(n,p,a,b)
% draws a binomial pdf and finds P(a <= x <= b)
% n = sample size
% p = probability of success
% a = min number of successes
% b = max number of successes

x = 0:n;
y = binopdf(x,n,p);

DrawPlot(x, a, b, y, n);

title(['Binomial Distribution (n = ',num2str(n),', p = ',num2str(p),')'])

end

function PlotHypgeomDist(n,N,S,a,b)
% draws a hypergeometric pdf and finds P(a <= x <= b)
% n sample size,
% N population size
% S successes in the population

x = 0:n;
y = hygepdf(x,N,S,n);

DrawPlot(x, a, b, y, n)

title(['Hypergeometric Distribution (n = ',num2str(n),', N = ',num2str(N),', S = ',num2str(S),')'])

end

function PlotPoissonDist(n,lambda,a,b)
% draws a poisson pdf and finds P(a <= x <= b)
% n successes
% lambda mean successes per interval

x = 0:n;
y = poisspdf(x,lambda);

DrawPlot(x, a, b, y, n)

title(['Poisson Distribution (\lambda = ',num2str(lambda),')'])

end

function DrawPlot(x, a, b, y, n)
figure
hold on
stem(x(x<a | x>b),y(x<a | x>b),'MarkerSize',4) % draw pdf
stem(x(x>=a & x<=b),y(x>=a & x<=b),'filled','LineWidth',1,'MarkerSize',4,SeriesIndex=2)
hold off

if n <= 20 % label stems for small n
    for i = 1:length(x)
        txt = ['P(X = ',num2str(x(i)), ') = ',num2str(round(y(i),4))];
        text(x(i)+0.33,y(i)*0.67,txt,'rotation',90);
    end
    axis([min(x)-1,max(x)+1,-inf,inf])   % adjust x-axis to fit labels
    xticks(x)
end

xlabel('X'),ylabel('P(X = x)')
total = round(sum(y(x>=a & x<=b)),4);   % sum probabilities, y, for x in [a,b]
str = {['P(',num2str(a),' $\leq$ ','x',' $\leq$ ',num2str(b),') = ',num2str(total)]};
dim = [0.65,0.8,0.1,0.1];
annotation('textbox',dim,'Interpreter','latex','String',str,...
    'Color','r','FontSize',12,'BackgroundColor','#ffffe0',...
    'FaceAlpha',0.9,'FitBoxToText','on','HorizontalAlignment','center',...
    'VerticalAlignment','middle')
end
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":7}
%---
%[text:image:33ab]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
%[text:image:3d02]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:80f8]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:1866]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:788d]
%   data: {"align":"baseline","height":111,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAbsAAABvCAIAAAD60\/nEAAAMGElEQVR42u2dzVLbyBqGLW4hXAFUJWt+Yi4guYYwMBWIcxdDquJT2QxTwA3EC5j1cDawOtmc8QUAy+NZxbOAdQzrZE63Wmp1q1s\/lrEtmectVcoocqv7dfejr7sldauFEELI0ffv3\/9xJP\/jr7\/v2eayYb7XE1Ev8SFnC4JgMBzhw1S3paUliAkxISbEZIOYEBNiQkw2iAkxISYbxISYbBATYkJMiMkGMSEmxISYj7Sdb7da22fiw83BhvqQ2rL2F6TZarUP+gtKzLNOa\/d8ctuLEtE\/Te2JKQxptda612Ol+aXbbm0cfskqeyD9GRTaGATbZ6MnScybD5vB9uloMKX0+7+tB4Fsxzt\/DIbmb\/3bh7550psPPx9+maDgX\/61FWz++p9yKVQhZm\/XujtprXtTJ2IqVobHh62o1er0cr8iizMpfWZJTOmGVGZTLyxUZFGJX7AkMeMsWXrky1U2MVPF6fSGExIzZKXlz\/XExLw52Aw8Fv05mg0xez9L9qx9vB4Y+RHlGtSYmBJkuzYro7IsrYucD02wbgknB3Umpm5jss4VIan8DzA5MSUprDYQNuZcIDaLmCK3worc4KigUI5F0+guzKlX3j9ckxkYTULM3m4wNX9iwp6OZhxjCmKub4im2v4lYjTEnBMxwzhOE9O82kchRhKQxrXQ2aOBGH7oykpvBykmMY1TeKMDt8UmObT+N2wtne0NJ9Tq6wzoYnrKFeaqfXCmDxan0KGWGV55Mux6Mm6v3G3qRpq+QhVDLauM+qcxC5sVP3oTr1YrJiRmdoaT37e9vesSUwaYGcyVsHPCQ4me6Iyb9hn\/HJUj5vlPnmSjqDA0RDRm\/57xiNm9\/rwbxAzSxJRn19T70t0KNg5Ddggabh2cHq5F53z3eXgtvhL+IbE70MTs\/hofo\/fLNI2sjmK86gRFamkHYguiRAQW9a43p98GZYl5\/tNS+tRmUmsfr6Iv6i5\/q\/1mpx24B2\/4GfoYMaYBvvR+WTvtCNTdYxNT89cIhWykniXfSuNAJu405mSnS0yZvh2OyWN0sr2uOMBXrr9TuY1YqRL35dzIsMeBiYnppJkZY8rrh8u7vDL6fxp\/AOsSs3KtqETMs04Q9crFeQPdQ5dhYzQiKYEY9bIVOlPElCl4rwcRYv6yyJIipnVGyaZiYlqxXpJs\/3A9EEmNTIvSe8Yn5kAmoqBchpgCHQpt6nNLHSbBHdHEPEbvDw05TZC6FtHNOjgVqMbHhOFejKqcGDNIj3AozqqY91t86qV1yceb3pkO794vBZ3PX0Xi\/xZgjegp0LkURHyUn9UBUxzHjKtXqtIrTp2pa74bBWQSM\/mvhHTxfvsUsvml2q0V8FYippuCt1z9dG7Tiah26M2wx4FHIaaVZi4xvRbll9EqbPaYgEPM6rWiAjENGobE1KFikmGVn2F2QRLmOhYFxn75Z4IeTUzjjBqpucRMcVATTX6wO7zungrEtLlWSEy9X35Lw+vsfbDpOSaM2tphFNnRWDSol9GFl99KjjcDxrGJqZL6ap36f9ZVRybuP3JTEzNk7nB6vfLMpigaT9jq4k6QjUJzT2liRjM5hlJQmDzGdIGSVa4yxMzKsOvJxL3yVJqZxPRaVFxG+6fRBSwkZvVaMS4xowHrZGbDIKbkYPyLBPnE9PrjIakAXx4x1RmLiSkOM3kh+RV3zENEtuLIzr9nfGKq3uj26fW0iPmxE6R4tpNLTJFa2oFiYvp75TKp9KkFMWU6gc3WJNh0xjFVyKmGAoazJGaq5rkVsSiQKYwxs3qFqbwZreIxiDlBjFkKXpWJaaeZ33FO\/3zFZXwkYo5RK8YiZgqX2cQsjDGtQDWbmEUxZkViJr3m+zH2jEXMCItysHsGMWbxNFGKmOViTD8x7cjRimG\/jkrFmOa3lrZ++a\/nyvR4xEyNAKYnZHXYUhDI5I5j+lq7ixLzRGGUZwazMUfC6Ygwfbt3745jZpWrBDELMux6MjEx4zQ9QxaWRTb+djtFZaxKzOq1Ygxi+mb\/M4hpATG8i8gpSOyP8V3JYkk6TVI1n+6OY45NzDjZBEzpWR0j6rSjsMrE1HNN4c1GMtsxmML9xhhlGWI645gyEZnysOTEunW87HGXGMfMmPk5D0cn7VOb4aT8rEY8jXHM8HOQnucRO7cOpkxMa5Y5Ap\/ZLVUN2N2TmpDtdlo5c+XWKfw9uNTtou54WZQ9KxI0ppXdHLrlKktMX4Y9Dox3d5Elt\/tv59n7SykoWCUqKGNlYlauFaWJaTsce5JFTBUtxhWs6y9I2p+hjivduz4nJGbS11bJRtGWjLy0ISE13D3ViRmlFt2emcwadz6fdrzxYzYxt4SHQWquPElQzXQbE+ve8QTr+He+MdDSdxelT\/0tnA5ainbtvHsTXn4GET3jbH+MS\/37+2SIdMceA+UpSZ6S5ClJnpJk47lyiAkxISYbxISYEBNiQkyIyQYxISbEXARiIoQQKrsy2j9oTsJ8PKkgEWP++PEDH6aqvBgTd6ADnkBMBDGhA55ATAQxoQOeQEwEMaEDwhOICTERdMATiAkx563Ly8u9vT3oUFn9fv\/6+lr\/+fDw8OnTJ\/EvxKyhMw0lpmikIsNHR0fNovyiEVPU3VevXonMi39rUo+bSAdxvTk+PtZ\/CkY8f\/7cJMWTJWYNnWkcMe\/u7lZXV\/XtjSsrK7e3txBzbhVaXLtEnYaYEBNi1l\/CuuXl5YuLC4g5T0FMiAkxISbEhJiz40LqybBnz55BzCxnrq6uIGY1iR6h6KHTK4eYEBNiQswCqQHNZk3+QEyISa+cXvkcJJrn69evhZ\/MlUNMiAkxIeYC4hJiQkyICTHnoP39fdFC7+\/vG9c2F\/DuInOMqaHchJgQc4GJqebHU+20KfTkKUmIiScLIp6ShJjQAeEJxISYCDrgCcSEmAg64AnEfKLERAghVHZlNIQQQqwlSQ8UT+iVI8YxoQOeQEwEMaEDwhOICTERdMATiAkxEXTAE4gJMRuhy8tLkXnz4V\/oMK5YGQ1izqap7u\/v87a3uenu7m5lZcVccUnsgZgVxJs4vFLvKOONwo\/oZOPeYLSwvXLRvEVVFhcxiAkxp3FtXl1drVvtatbb3i4uLtRbGSEmxISYEBNiFuvk5ARi1miIhF75JMRknR+ICTGfCjHVgGZzJ38gJsSEmBBzRnp4eBA\/g2jzzSU+vXKICTEhJriEmBATYkLMOkk09UaviQYxISbEhJgzkpofZ2U0iAkxa679\/X2RW1ZGQwtIBzxpinhKEmJCB4QnEBNiIuiAJxATYiLogCcQ84kSEyGEECujIYQQK6PRA8UTeuWIcUzogPAEYkJMBB3wBGJCTAQd8ARiQkwEHfAEYkJMiAkd8ARioidJTLWWJO\/HhJjTUA1X2WwuMVlLcs5Sr14XrFQfWLWimtQ7RnkHu1c1fKtTE4nJWpK1U62qckPpoC48NXmnGcRcJGKyliTEhJgQE2KOJ94oXCNcil4kK6NBzGkQ0x2vuLq6gpgQs5HENF\/D3tzlKyAmxISYEHMOrb2hYSbEpFcOMSHmHCp3Q+8xgpgQE2JCzFl0yfv9vtk9J8aEmBATYkLMvBauB5iaexM7xISYi01M1pJEC0gHPGmWeEoSYkIHhCcQE2Ii6IAnEBNiIuiAJxDziRITIYQQK6MRT+EJMSaiVw4d8ARiIogJHRCeQEyIiaADnkBMiImgA55ATIiJoAOeQEyIuYDE3Nvbq8kD0dABTyCmq7u7u9XVVd7EUQsdHx\/zRuHKYmW0HGfUel68UXhCnZycLC8vC99EUxXZvri4gJhzk2jYL1++7PV6EHPyKIB3F+XER3XrxDSFmKKFvnjxQl9mmvXOtwUkpnofl6jNEBNiQswaSvgm3Lu9vfX+CTFn\/WMoUEJMiAkxa9slN4NKEXK2222IOQepAThVjyEmxISYEBNi5kl0xvV71yEmxISYEBNi5sm7MmpNVhSAmBATYupoxhy4ZOanLr8KMSbEhJg1lHLv6OhI5FbdsCV6h025LwpiQkyICTHn0Dz1ymhv375t0I33PCUJMfFkQcRTkhATOiA8gZgQE0EHPIGYEBNBBzyBmE+UmAghhEqtjMbFBCGEyvaBsAAhhCAmQghBTIQQmpP+Dw0Xg08KZFcoAAAAAElFTkSuQmCC","width":443}
%---
%[text:image:1508]
%   data: {"align":"baseline","height":87,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAK8AAABXCAIAAAD9MYJWAAAFCElEQVR42u2cPXLyMBCGfQdukCI9w4QLcAjPUDDDNWhoKXIDGh8gHV06LhDqlF+TA3w5AJEsW15JK\/mPECy9O0yGOIrk3X20K8k7zjJI2nIlIn\/\/\/Pcfn0f4KPfceUTQABpAA2gADaABNIAG0AAapkbDZbfI8uLX+j8f5sqo6zfjenHYnc3bWB\/eRwz0vl9mi1E93IgGac\/5\/uL561uehazdg4bjWv6VjBQe+CFokE6yOKh1Me5cQrM0+XhoGpQvtDS6SEW2x\/4GGULDfLHMGquBhr+kQd+\/HLomIOzsVlx60rC\/SCqr8TQNRvwhdhENlruijtXyJuS\/lGIgle91G31d9llJY2XaoaUSaV93QieQBVyQBmZo2pU5EasR8\/WSaezng7rws9hmnIc60kD\/XV\/39x9KFr1pIIbrQoN2W8WBaibtxbTR12nAoBHIaOxLlnSaBmKDI41SztCXY+GaXmpdDaqwUIO2xWp6z+W9ed3TIzZU+tKufP2HInp\/GkyftdKgr5OgUtqUa1OhVhgGJR71pBXLAWSi96bh7Bva6dxt2dDQLfeVXc0XmS+2d143GFHNMqbbvx0XR9JQK\/xrNOy3tqfCNNiRVtxPOw18pij4ocvAa1rfHNRYN9QZpJWJ0qne9UrXTOHfMrD935qGSvltfpfY0L7ktGjoFht4Gtg4Ty+2xobuK9Oyh3ztXV6MpYHv\/9aZgi61VFrdNeGovN6TBmfdQFJypw2I0Z4sSgbsKbihKW3yu9uSat0xRPGRdRwN9hqL6z+0iRtMQxVUjWWUWup75r2fBpoa6snUdEhDrl8To30w8bfuKZih9VZIqLDVPiZppVRBaURzTT20oTu71B2zp+B21N7+gxELJ9N3+DRB4tfPIlt3NM08BA1\/8RFTc9gZ3eCTaf\/qteWsDzRE99TqfMgDzymCJ5WgAc8wgzRAUCXb0HCFPIa47rnDiKABNIAG0AAaQANoAA2gIW0aXl9fN5tN6jR8fX09PT2tVqvv7+\/oaTidTqzLhe7CAuKv+opoRn9NggYxIWaz2cfHh\/gidGnVf7o0KH+LBiz3wgIvLy9iYmiz+FpGS4MwwfPzs\/ipTTDpCBGmQc11n46bUigZx+MxLRqEdUSO0BPC+jXKTMHSIFQW7tezQmAhmglrpEWDZRorWqZDA3W8\/g4aEqVBBQNrLQkaUqSBpgm6yUyOBmuhEPcq0qcjvSJQsB5Rqg1XEjSokwYaJNX3dGgIaJ1cbFA663nQ9yRucjtMOumVpwPJMUUaYpIBJ9MDTqNBQ5w0uKfRoCHp2DB+RNAAGvw0QFAli9iA2IBMARpAA2gADaABNIAG0AAaUCVbia92NDIa1EMZ9hkVqmQbK3SpCJ00DepprT4kcAv+UCXbzICpVzb0yhTC8bPZzJr3qJI1UmbKNKBKNl0a3NJwVMkmSgMt96JpAlWyydGgnG3tnlAlmyINLApXVMmmSYPwtKsjqmRtG7m1o\/HRoPYRqJJNSFAlCxlOA6pkQcONRwQNoMFPAwRVsogNiA3IFKABNIAG0AAaQANoAA2gAVWyUgK1o\/HRgHfJeqW1djQmGvAu2R7C1o7GRAPeJQsamMUB3iXbafUQd6YI0IAqWWYBMfWFJN4lewPxFQwmQgOqZCNE4Yp3yY4XtnY0HRpQJWvvI1Kokr3iXbKpCapkIcNpQJUsaLjxiKABNPhpgKBKtqIBMxICGiCM\/ABp2jTM0JKWgwAAAABJRU5ErkJggg==","width":175}
%---
%[text:image:9b60]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:34de]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:4f41]
%   data: {"defaultValue":0,"label":"n","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:1820]
%   data: {"defaultValue":0,"label":"p","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:7ddc]
%   data: {"defaultValue":0,"label":"a","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:7dce]
%   data: {"defaultValue":0,"label":"b","run":"Nothing","valueType":"Double"}
%---
%[text:image:1c35]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:0170]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:12f3]
%   data: {"defaultValue":0,"label":"n","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:0b46]
%   data: {"defaultValue":0,"label":"Edit field","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:51f7]
%   data: {"defaultValue":0,"label":"S","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:3392]
%   data: {"defaultValue":0,"label":"a","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:92e6]
%   data: {"defaultValue":0,"label":"b","run":"Nothing","valueType":"Double"}
%---
%[text:image:07e4]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:4a2d]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:5f24]
%   data: {"defaultValue":0,"label":"n","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:21d3]
%   data: {"defaultValue":0,"label":"N","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:6256]
%   data: {"defaultValue":0,"label":"a","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:75b2]
%   data: {"defaultValue":0,"label":"b","run":"Nothing","valueType":"Double"}
%---
