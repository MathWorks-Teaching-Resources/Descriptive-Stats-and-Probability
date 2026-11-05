%[text] %[text:anchor:T_EED2BDF2] # Continuous Random Variables
%[text] ***Author***: Ward Nickle, Humboldt State University
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
%[text] This live script is intended to be used with the code visible and output inline. On the **View** tab of the MATLAB Toolstrip, in the **View** section, select **Output inline**. Alternately, select **Output inline** using the icon ![live script output inline icon](text:image:5c33) at the top right of the Live Editor pane.
%[text] ![Lightbulb mark](text:image:02ce) Interacting with this live script will build some familiarity with MATLAB as concepts and commands are introduced together. If you need more instruction, consider taking [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted), a free 2-hour online tutorial that teaches the essentials of MATLAB.
%[text] ![Warning symbol](text:image:2d2a)   For an optimal experience, follow the instructions and steps in the given sequence. Proceed to a new section only after completing the preceding one. Some sections depend on variables created in prior sections and they will generate errors if run out of order.
%[text] The ![Try this icon](text:image:52ff) icon refers to an interactive activity that you will find in this script. 
%%
%[text] %[text:anchor:H_FD638CAA] ## Background
%[text] Coins, dice, and playing cards are commonly used to describe discrete random variables and their associated probability distributions. For example, if we consider the number of heads in two coin tosses, there are a fixed number of possible outcomes and a probability for each. 
%[text] On the other hand, continuous random variables can take on an infinite number of possible values. For examples, consider the amount of time it takes to start a computer or the depth of a water body at a randomly selected point. The values of these variables are obtained by <u>measuring</u> (as opposed to counting<u>)</u>. As a consequence, it is not useful to think of a continuous random variable taking on a single value, but very useful to think of the probablity of such a variable taking on a value within a given interval.
%%
%[text] %[text:anchor:H_6498F59A] ## Uniform Distribution
%[text] A uniform random variable is one in which every value is equally probable. Due to this quality, the shape of the distribution is rectangular. There are two parameters that describe the shape of the distribution, *a*, the minimum value of the random variable, and *b*, its maximum value. One can therefore determine the mean based on the average of *a* and *b*, that is, the midpoint.
%[text]{"align":"center"} $\\mu =\\frac{a+b}{2}${"editStyle":"visual"}
%[text] The standard deviation of a uniform distribution is given by the following formula:
%[text]{"align":"center"} $\\sigma =\\sqrt{\\frac{{\\left(b-a\\right)}^2 }{12}}${"editStyle":"visual"}
%[text] Similarly, the probability of the random variable can be found by using the area formula for a rectangle, the range of the distribution, and the fact that the total area is 1. Since the base of the rectangle is the range, $b-a${"editStyle":"visual"}, and the area is 1, it follows that the height is $\\frac{1}{b-a}${"editStyle":"visual"}. With continuous random variables, probability is equal to the area under the curve formed by the probability distribution.
%[text] Because the random variable is continuous, it can assume infinitely many values. The probability that x is a particular value is 0, because this region has no width and is therefore one-dimensional and has no area. Instead we consider the probability that x is between two values, $x\_1${"editStyle":"visual"} and $x\_2${"editStyle":"visual"}, and find the area of the corresponding rectangle. The probability is then given by the following formula:
%[text]{"align":"center"} $P\\left(x\_1 \<X\<x\_2 \\right)=\\mathrm{base}\*\\mathrm{height}=\\left(x\_2 -x\_1 \\right)\\frac{1}{b-a}${"editStyle":"visual"}
%[text] ![](text:image:545b) **Example**
%[text] Suppose the wait time to be served at a local bank is uniformly distributed between 4 and 10 minutes. What is the probability that a customer will be served in less than 6 minutes? As with all continuous random variables, we are interested in the cumulative density, that is, the probability that the random variable is in a range of values. Thus, we employ the continuous uniform cumulative distribution function, [p = unifcdf(x,a,b)](https://www.mathworks.com/help/stats/unifcdf.html). 
unifcdf(6,4,10)
%[text] What is the likelihood that the customer will have to wait longer than 5 minutes? We can use the complement rule to answer this question, since $P\\left(X\>5\\right)=1-P\\left(X\<5\\right)${"editStyle":"visual"}.
1-unifcdf(5,4,10)
%[text] Alternatively, we could use the 'upper' argument in the cdf.
unifcdf(5,4,10,'upper')
%[text] ![Try this icon](text:image:47ac) **Task**
%[text] The helper function `PlotUniformDist` draws the probability density function (pdf) and displays $P\\left(x\_1 \<X\<x\_2 \\right)${"editStyle":"visual"} for a uniform random variable. The bounds on *x*, *a* and *b*, must be real numbers where $a\<b${"editStyle":"visual"}. The probability is shown for values of *x* between $x\_1${"editStyle":"visual"} and $x\_2${"editStyle":"visual"}, where $x\_1 \<x\_2${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:5e9a]{"position":[1,2]}
a = 4; % min of distribution %[control:editfield:9b19]{"position":[5,6]}
b = 10; % max of distribution %[control:editfield:4482]{"position":[5,7]}
x1 = 5; % min of interval %[control:editfield:6469]{"position":[6,7]}
x2 = 10; % max of interval %[control:editfield:59ac]{"position":[6,8]}
PlotUniformDist(a,b,x1,x2)
%%
%[text] %[text:anchor:H_DEC17EFA] ## Normal Distribution
%[text] The most common distribution for a continuous random variable is the normal distribution, which has many distinguishing qualities. Normal distributions are bell-shaped and symmetric with tails that approach the x-axis asymptotically. Because they are symmetric, the mean and median are equal and are the center of the distribution. Given the bell-shape, as we move away from the mean, the height of the distribution decreases, which implies that these values are less likely than the mean. Finally, because normal distributions are asymptotic, when we get far enough away from the mean, the height of the curve approaches 0. There are two parameters that describe a normal distribution entirely: the mean, $\\mu${"editStyle":"visual"}, and the standard deviation, $\\sigma${"editStyle":"visual"}. The normal distribution is given by the following formula:
%[text]{"align":"center"} $P\\left(x\\right)=\\frac{1}{\\sigma \\sqrt{2\\pi }}e^{-\\left\\lbrack \\frac{{\\left(x-\\mu \\right)}^2 }{2\\sigma^2 }\\right\\rbrack }${"editStyle":"visual"}
%[text] ![](text:image:7dc1) **Example**
%[text] A recent USDA report suggests that the average family of four spends an average of \\$218 per week on food, with a standard deviation of \\$24. Assuming the cost is normally distributed, what percent of families of four spend more than \\$250 per week on food? We can answer this question with the normal cumulative distribution function, [`p = normcdf(x,mu,sigma)`](https://www.mathworks.com/help/stats/normcdf.html#d120e513735). As above, since we are interested in the upper-tail probability, we can use the complement of the lower-tail probability.
1-normcdf(250,218,24)
%[text] Again, it would be equivalent to use the `'upper'` argument.
normcdf(250,218,24,'upper')
%[text] Suppose we were interested in the amount of money spent by families in the 99th percentile, that is, the value of x that corresponds to a lower-tail probability of 0.99. This is of common interest and is found by using the normal inverse cumulative distribution function, [`x = norminv(p,mu,sigma)`](https://www.mathworks.com/help/stats/norminv.html#d120e515658). Recall that inverse functions trade domain and range, so if we are interested in a value of x given p, we are, in essence, going in reverse.
norminv(0.99,218,24)
%[text] ![Try this icon](text:image:4470) **Task**
%[text] The helper function `PlotNormalDist` draws the probability density function (pdf) and displays $P\\left(x\_1 \<X\<x\_2 \\right)${"editStyle":"visual"} for a normal random variable. `mu` can be any real number, but `sigma`, must be non-negative. The probability is shown for values of *x* between $x\_1${"editStyle":"visual"} and $x\_2${"editStyle":"visual"}, where $x\_1 \<x\_2${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:8933]{"position":[1,2]}
mu = 218; % mean of distribution %[control:editfield:2895]{"position":[6,9]}
sd = 24; % sd of distribution %[control:editfield:7b38]{"position":[6,8]}
x1 = 194; % min of interval %[control:editfield:125d]{"position":[6,9]}
x2 = 266; % max of interval %[control:editfield:6211]{"position":[6,9]}
PlotNormalDist(mu,sd,x1,x2)
%%
%[text] %[text:anchor:H_9528A0E7] ## Standard Normal Distribution
%[text] Since there are infinitely many possible normal distributions, it follows that one may wish to standardize a normal distribution to provide a consistent perspective. That is the motivation of the standard normal distribution. The mean of the standard normal distribution is 0, and the standard deviation is 1. To transform a normal random variable to a standard normal variable, we calculate a z-score, sometimes called a z value.
%[text]{"align":"center"} $z=\\frac{x-\\mu }{\\sigma }${"editStyle":"visual"}
%[text] In words, a z-score is the number of standard deviations that x is away from its mean. Sign indicates direction, so negative z-scores represent values of x that are below the mean, and positive z-scores represent values of x that are above the mean. Z-scores provide a standard way of viewing a value of a normal random variable. Using the Empirical Rule, which asserts that approximately 68% of the observations are within $\\pm${"editStyle":"visual"}1 standard deviation of the mean, and that 95% of the observations are within $\\pm${"editStyle":"visual"}2 standard deviations of the mean, one can immediately infer a likelihood associated with a particular z-score.
%[text] ![](text:image:928a) **Example**
%[text] A pregnancy that lasts between 252 days and 298 days is considered full-term. If pregnancy is normally distributed with a mean of 272 days and a standard deviation of 9 days, what proportion of pregnancies are full-term? What are the z-scores for 252 days and 298 days? To find the proportion, we don't need to standardize the variable, but if we do it provides insight into the number of standard deviations the values are from their mean. The z-scores can be found using arithmetic.
z1 = (252-272)/9
z2 = (298-272)/9
%[text] Now the proportion can be found using the [`p = normcdf(x)`](https://www.mathworks.com/help/stats/normcdf.html?s_tid=srchtitle#d120e513700) function, which assumes a mean of 0 and an sd of 1, that is, the standard normal distribution. Note that this function reports the area to the left of its input, so we should subtract the area to the left of z1 from the area to the left of z2. In symbols, $P\\left(z\_1 \<Z\<z\_2 \\right)=P\\left(Z\<z\_2 \\right)-P\\left(Z\<z\_1 \\right)${"editStyle":"visual"}.
normcdf(z2)-normcdf(z1)
%[text] ![Try this icon](text:image:1caf) **Task**
%[text] The helper function `PlotNormalDist` draws the probability density function (pdf) and displays $P\\left(x\_1 \<X\<x\_2 \\right)${"editStyle":"visual"} for a ***standard*** normal random variable. The probability is shown for values of *x* between $x\_1${"editStyle":"visual"} and $x\_2${"editStyle":"visual"}, where $x\_1 \<x\_2${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
  %[control:button:7d0d]{"position":[1,2]}
mu = 0; % mean of distribution
sd = 1; % sd of distribution
x1 = -2.2222; % min of interval %[control:editfield:37fb]{"position":[6,13]}
x2 = 2.8889; % max of interval %[control:editfield:9322]{"position":[6,12]}
PlotNormalDist(mu,sd,x1,x2)
%%
%[text] %[text:anchor:H_6F6DAF50] ## Exponential Distribution
%[text] The exponential distribution is used to find the time between events that occur in a sequence. The events are considered independent and occur with a constant rate. The exponential distribution is positively skewed and defined by one parameter, $\\lambda${"editStyle":"visual"} (lambda), the rate parameter, which is equal to $\\frac{1}{\\mu }${"editStyle":"visual"}, where $\\mu${"editStyle":"visual"} is the mean arrival time. The probability is given by either of the following:
%[text]{"align":"center"} $P\\left(x\\right)=\\frac{1}{\\mu }e^{\\frac{-x}{\\mu }} =\\lambda e^{-\\lambda x}${"editStyle":"visual"}
%[text] ![](text:image:0bcc) **Example**
%[text] Suppose the time it takes to start a computer follows an exponential distribution with a mean of 27 seconds. What is the probability the computer will start in less than 15 seconds? Let's use the exponential cumulative density function, [`p = expcdf(x,mu)`](https://www.mathworks.com/help/stats/expcdf.html#d120e235154).
expcdf(15,27)
%[text] What is the likelihood that it will take between 30 and 45 seconds to start the computer? Here we should find the difference between the probability of the start time being less than 45 seconds and the probability of the start time being less than 30 seconds, since $P\\left(30\<X\<45\\right)=P\\left(X\<45\\right)-P\\left(X\<30\\right)${"editStyle":"visual"}.
expcdf(45,27)-expcdf(30,27)
%[text] ![Try this icon](text:image:66c2) **Task**
%[text] The helper function `PlotExpDist` draws the probability density function (pdf) and display $P\\left(x\_1 \<X\<x\_2 \\right)${"editStyle":"visual"} for an exponential random variable. The probability is shown for values of *x* between $x\_1${"editStyle":"visual"} and $x\_2${"editStyle":"visual"}, where $x\_1 \<x\_2${"editStyle":"visual"}.
%[text] Enter an appropriate value in each text box below to answer one of the questions in the example above. Click the **Run** button to visualize the solution.
   %[control:button:3644]{"position":[1,2]}
mu = 27; % mean arrival time %[control:editfield:5ccd]{"position":[6,8]}
x1 = 0; % min of interval %[control:editfield:233e]{"position":[6,7]}
x2 = 15; % max of interval %[control:editfield:799c]{"position":[6,8]}
PlotExpDist(mu,x1,x2)
%%
%[text] [⇦ Main Menu](file:../../MainMenu.m)
%%
%[text] %[text:anchor:H_26A60026] ## Helper Functions
%[text] These functions plot the different distributions discussing in this script given their defining parameters and an interval of values.
function PlotUniformDist(a,b,x1,x2)
    % a min of distribution
    % b max of distribution
    % x1 min of interval
    % x2 max of interval
    
    h = 1/(b-a);
    figure
    hold on
    
    x = [a,x1,x1,a];
    y = [0,0,h,h];
    fill(x,y,"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    
    x = [x1,x2,x2,x1];
    y = [0,0,h,h];
    fill(x,y,"r","SeriesIndex",2,"FaceColor","flat",'FaceAlpha','0.5')
    
    x = [x2,b,b,x2];
    y = [0,0,h,h];
    fill(x,y,"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    
    p = round((x2-x1)*h,4);
    
    xticks(unique([a,b,x1,x2]))
    yticks(round(h,2))
    title({'Uniform Distribution',['P(',num2str(x1),' < X < ',num2str(x2),') = ',num2str(p)]})
    xlabel('X')
    ylabel('P(X = x)')
    
    hold off
    
end

function PlotNormalDist(mu,sigma,x1,x2)
    % mu is the mean of the distribution
    % sigma is the standard deviation of the distribution
    % x1 min of interval
    % x2 max of interval
    
    l = mu-4*sigma;
    r = mu+4*sigma;
    x = unique([(l:0.01:r),x1,x2]);
    y = normpdf(x,mu,sigma);
    p = round(normcdf(x2,mu,sigma)-normcdf(x1,mu,sigma),4);
    
    figure
    hold on
    
    left = find(x<=x1);
    middle = find(x>=x1 & x<=x2);
    right = find(x>=x2);
    fill([x(left),fliplr(x(left))],[zeros(1,numel(left)),fliplr(y(left))],"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    fill([x(middle),fliplr(x(middle))],[zeros(1,numel(middle)),fliplr(y(middle))],"r","SeriesIndex",2,"FaceColor","flat",'FaceAlpha','0.5')
    fill([x(right),fliplr(x(right))],[zeros(1,numel(right)),fliplr(y(right))],"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    
    axis([l,r,-inf,inf])
    xticks(l:sigma:r)
    title({['Normal Distribution (\mu = ',num2str(mu),', \sigma = ',num2str(sigma),')'],['P(',num2str(x1),' < X < ',num2str(x2),') = ',num2str(p)]})
    xlabel('X')
    ylabel('P(X = x)')
    
    hold off
    
end

function PlotExpDist(mu,x1,x2)
    % mu is the mean number of success per interval
    % x1 min of interval
    % x2 max of interval
    
    close all
    l=0;
    r=round(expinv(0.995,mu));
    
    res = 0.1;
    x = unique([(l:res:r),x1,x2]);
    y = exppdf(x,mu);
    p = round(expcdf(x2,mu)-expcdf(x1,mu),4);
    
    figure
    hold on
    left = find(x<=x1);
    middle = find(x>=x1 & x<=x2);
    right = find(x>=x2);
    fill([x(left),fliplr(x(left))],[zeros(1,numel(left)),fliplr(y(left))],"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    fill([x(middle),fliplr(x(middle))],[zeros(1,numel(middle)),fliplr(y(middle))],"r","SeriesIndex",2,"FaceColor","flat",'FaceAlpha','0.5')
    fill([x(right),fliplr(x(right))],[zeros(1,numel(right)),fliplr(y(right))],"r","SeriesIndex",1,"FaceColor","flat",'FaceAlpha','0.5')
    
    axis([l,r,-inf,inf])
    title({['Exponential Distribution (\lambda = ',num2str(round(1/mu,4)),')'],['P(',num2str(x1),' < X < ',num2str(x2),') = ',num2str(p)]})
    xlabel('X')
    ylabel('P(X = x)')
    
    hold off
    
end
%%
%[text] ## Help us Improve
%[text] [Share your feedback](<matlab: ShareFeedback>) to help us improve this module.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":40}
%---
%[text:image:5c33]
%   data: {"align":"middle","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAjElEQVR42mP4\/\/8\/AwgnJiYapKamfgfS\/ynBUDMMYOYywBggiYcPH\/6nFIDMAJmFYQHIdmoBqFm4LZjrYPd\/gpoyGIPYVLeA5j6gmwUlJaVAxUlgDGKPBhFODaQG1QgIoqKtr\/6r99wlCYP0EG0BSMOWe\/9JwiA9oxaMWkBHC2ieD2iSk+lR6dOk2QIAjF+EgB\/BqfoAAAAASUVORK5CYII=","width":24}
%---
%[text:image:02ce]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAAsCAYAAAAXb\/p7AAADlklEQVR42u1YS0hUYRQejR4UvR+SvaCyWiS2DIoCKWjVYzG2SsYWQ+a8HRwXFkOgqdGLSoSeqyBaJUGLCKGkNpGtgiyScnpYBpaU5au+E+eH03Wu93rvP2OEFw46955z\/u8\/7\/\/3eDQ+4XD4Eui65199AK4d1DEJcBLgfw0wGo2ujkQi1yoqKlY5AFgDqnWw5lpaMxaLrbBkDgaDm7HIEKjTCcjxPqFQqABrdYEGsHaRXaESCAyCXpNFMwwuReDw\/77xusurQGJna0ysPR2K94CnGdQKesnUyu92J5PJaelk4c51Chzcu9dp0O9nkO3yvd\/vnwqlEbzvAf2yoB5sIkwyBt0doJ+0Qbdu2AXyC8UrOVuNQH5Q3IJegfrTfH8ikwC\/A9hjsdaYCQQCG6D4vVj0DShB7+HKXMGaQ\/EFADEGrPhJdn1GAhoZvRDKX4jFTvt8vhlWchSD4D0OGiE5AH9eXl4+PxNF+IoCB8sccyBfreQB8qJWcAC0CYqHeYE2cqEDNTmQvcc6hlC+CnXWq\/PCtTtdeGGr0HNWFz7aeTcr\/eT1eqe41PVWJYxd62zkovwXqQ6Cv8vErm9r8MZNEctLVf9Ph4GwecSOjPSQu8V28e6chmRrFPq28btHJhhSBKDIBH0B726HEDilAWCtsGCx6MmjMNgaHqBkiygPl3UmHE1OrjOEiqoqsqDHGizYxrqGAXCOriL9jJUOoq3lO9UDQItpQGD3PtXZRapFHB51oSchwiWsDWA8Hl8Cpb2svA+WWO4AXJ7Q0Z1IJObq7sUBN\/UQLr0hrHfANSCaQihrobiBf+dC+QOxSNk4MrdEyN1VvRy6T+DdVbOp2wpcCyutN8yDahjtVZ3A4sS2ALwflYxhaK1n0C22QfL8dkuNRYZBlKxxRLj6gg3XNgj+w8beLOriHcv50gocJ8wsfP\/ASgfMDlRs8XzwfGPeThMr2QcpEqFprJmPSoSwSvMYfCcFX6nFlNPEfAGrUuC1GkhxQpspTnTfKysrFxl5qqqqZouy0mU81ZmApB6cp2vKlrFVk+Z7TGRuPOsXRZSNfGYmEO\/ofoXmOiKKS3Ga6wPYeRNxk9Vo49BONAIL1mUdIBa9bxPgn+zMOkAqIXDdQbp1sKAy6uWeyWd0Cyuk5LDh3pTtez\/NSVJqNwbh5kNZB8htkTrP1zHA9dM1nZ07nExmc50ZQGA7M+GxyLden9MA\/OLm\/KKe34xPoKAD7jPkAAAAAElFTkSuQmCC","width":22}
%---
%[text:image:2d2a]
%   data: {"align":"baseline","height":23,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAA6CAYAAADhu0ooAAAEp0lEQVR42t2a208TQRTG67OJxvv9fiGoD6LGgPiCGo1G\/wljTKDl1pL00RuKIKCIIiKg6ItB8IJ38K4Panz13RcfSBBBQQHRek4ys\/kYpu1uu2132+Sku6eb6X7zmzlz5ux6PEn6lJaWbi0uLu4mGyLrJWvMz8+f4UmnjxA5QhZS7HNZWdnUdNE5hQR9EsLGioqKWuj7kRRbUlJSmS40D4Co4yD+rfAPEdW5rhdKQj4KQQM4J0n0DhjCVW4XuR9oHlV\/J98rSZVsnmuF0nz8oNIsLCxcFQwGp4vf86AjzrhV5D4dTTq+Tr8d0VD95fP5Frpx2L4XAgYlTQpMq+n8DxKm4+0wV6tdJZIo7YWbPwbi26QfqdL5S+H\/7SqqdMPvJE2iOFPOTUEzpM5bpEodUOMWkXs06yb7r6qZEc5dOn\/hKqqQCESiOYkqic4Ff62jRZKg3XCzJ0B8q0akjupzSZU6aZGTl5Q34kZ\/BgKB2ezzer3LOMcNJ5SpSvJIlY7POTWn3QUBpRzEt0QQqYvMzxxNlW7staRJQ3gO0Bw1IdSYz9Qx28Bf57QhuxNu7iSIbzYhclKEpvZ6HElVR5OOl5qkGZEqdcB5p9DMC0OzyYJIXaTuFr4R6rzFTkj3jK1WHDRDarSmdnPAX59qkbkQaU+B\/7IqglM7+g4qVqu5rhzaeeoIqpC2RaVJN52pGfYbdFRlW0iVrr2QcppkFSC+MUxUNSt0AlU6f5JSqpCuGcUtv9+\/JExZ05JQpErf2eC\/mOxIi4v6aRDfEGGdtCJUjeCPhW+Uk5BkCu2xQjNGoQZVWl+30Pk\/4W9I1tzM0RWfeVhFyXysCp0QyaHoPUZtLU\/G3OxWadIfL+Dilt1CMZrTtZuB6qVE7zezdUVnDv0mctlYhKpUHyaFKoR6SzTjEYr\/pVBtTDhNLDZz0m1ydxKrUHWdfiCp+ny+FYmgKUP8sHx8YJamDUK1VDnVtHs5wSFTDeLrLOw34xGqrtf3E0IVgoBRiiwoKJhvlqZNQjEubIKOb7Jr3TQaxeIyF6+sbMFsEKqu2\/ZShQZVmsPJFhqOKrVzxTaaWFTW7SNNCD3IlUI08h2KYXOO63eXpErtrYwnCHWpNDniWqVpsxlUacnLAhDNsa6bWTqaolIQSrFVwei6FxdVGlZ3baY5SNav2KCdVLlYblXkRqB5FnqvOlYKNgWjUJjsTEIZpzbXWIm0d9QCMlfneI\/oFKFKhoZgWs0GIP7zv+qDHu7BeOZVAoSqWZqEM+73+9eaodlpN80ECjXiBwLih87Rnoith4vrgGZlvJEyQUJVqrdNUaULOmRp0U6a8uUMssNo\/BDYBqHDnKlppt21qDTxwQ7vGhywbkbrxBrN1Bsny9DRbFcLxV6vdxad\/3C6UJyryvRrU7OgdfBjPYivcIHIkCYX79BSpZObLqYZkSq\/kicjaqZ04oMcrpS7SGRIzeJIy60JVDk6SZpcbRdDeRr5v2hyU6fbV\/l8VVlXm5lcX0wJsTveYpMVw14PzMOGNBQqE4h+3M8x5hti3UwH64S52y6D0YALA49Z6+P3hCXiDLH2fEsjgd+ZKr9wyRr\/A+UKAPezYlA8AAAAAElFTkSuQmCC","width":23}
%---
%[text:image:52ff]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[text:image:545b]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[text:image:47ac]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:5e9a]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:9b19]
%   data: {"defaultValue":0,"label":"a","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:4482]
%   data: {"defaultValue":0,"label":"b","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:6469]
%   data: {"defaultValue":0,"label":"x1","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:59ac]
%   data: {"defaultValue":0,"label":"x2","run":"Nothing","valueType":"Double"}
%---
%[text:image:7dc1]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[text:image:4470]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:8933]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:2895]
%   data: {"defaultValue":0,"label":"mu","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:7b38]
%   data: {"defaultValue":0,"label":"sd","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:125d]
%   data: {"defaultValue":0,"label":"x1","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:6211]
%   data: {"defaultValue":0,"label":"x2","run":"Nothing","valueType":"Double"}
%---
%[text:image:928a]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[text:image:1caf]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:7d0d]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:37fb]
%   data: {"defaultValue":0,"label":"x1","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:9322]
%   data: {"defaultValue":0,"label":"x2","run":"Nothing","valueType":"Double"}
%---
%[text:image:0bcc]
%   data: {"align":"baseline","height":24,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF4AAABMCAYAAADkzAD+AAABzklEQVR42u3cXXGEMBSG4ZWAhJWABCQgAQcgAQkrIRIqAQlIiAQcUDJDO91OKFBCOCe8F9\/1Js8y+TkJPMZxfJD4AQF44AnwwBPggSfAA0+AB\/4tdV1nU4pEk4uEdw2bMkwZE46RCN8njv6VXBr8eJMUkuGLlCZL4IEHHnjggQceeOCBBx74UI16Tml+1zT2FJWA31+JfK1srzv3xwAfFn1rUWzQ\/vRLgu92FpYcfgb8sUZUZ9aygT+n7p4Bf03dvQD+fw0oDsK3wAN\/q6GmBP6ayfUJfPzlZMdyMv5Tr3r3KgneFcbsDviKkkHYes3HCrhNoUQstSzsru61nqpkpR2cgxDggY8OPy8jj15MtfOwlAG\/7YdN4IufVtPy8hJ4z8QZKj3wf6\/Xz7zy3ADv\/8HmZPgO+LjDzFtHFCRJeN4IAR544M\/uCC8YAw888MADDzzwwIuFn2voKX9Rw0iFv8OGpgEe+G943xjdK\/1C0muhL5nIyXXhyp2qtzMW+tBLPbtd+2xVqwQ91\/bg+I7xft4SGJTAG23HhVteLMgVwFttR4Vbzg\/NPAFLjrrhccsTpC2lZviSXepFtZp5om0VpbpVkYwADzwBHngCvIh8Ag3lAhMN2JymAAAAAElFTkSuQmCC","width":30}
%---
%[text:image:66c2]
%   data: {"align":"baseline","height":26,"src":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAApCAYAAAAiT5m3AAADOElEQVR42r1XSWgUQRSNGndR3Ii7V\/EmCCp4DaIe1Oh4EMHBwMjsq47Eg+OOJ0VIICAeFAIeXEADHgyoqChE1ASNhISAxH0jg5gxq+\/FX1A009PTM93T8OiuX7\/q1f+\/+tevqqoCTyKRWBmNRo8Cj4GPwF++I5HII7zT8Xh8eZWTTzgcnh6Lxc5j8kFgHMgCT4G7wBPgl8j\/YBGnfT7f1LJJg8HgQrGQE3diAXVciK5DIsi3o7+devh+4Pf755dMmslkpmGih0LaiHa1hf5k6J0T\/TYrfdMHKz8pFjTr1kFWD9ltvJ8Bt\/Dt1d0rYeG4Y7ZJMbAG+A300HLKuHkw2SuxKAe8lQ3Gdjv6llLP4\/FMQfs1MMBQ2SUOyaoPihur0X4BDGEDHVGLYbwhawCG6QG6W6yu43jo+uwSt3IyWLlA2vt09+F7CwlDodAaaZ+Q\/j3inZn0GENil\/gd0Ke1rwEjgUBgDqzYIe4lBiBbkkqlZov7r2hjXtLldom\/0LVa+x7QK9+NGjHduUvkfcAdbUwb0G+XuNtg8WV6QeLXbCDeKzo9QJM2phPosEt8ExijG9nG5NuKJK6VTTeXrofudbvEh2TS49r\/eakQMeQXNV2v9Nfbzc9c8U\/GWv2LKkmYEat+r9c7Q+L9nZvOdhLBhOF86c+MWJ5JkLVIX6jUdM1Jbsgk3NU1RRBPHCzQ2crxZR0U3CBC8saKGO3NCNNGx85kpk4QPLfaXJr8jGPkKs4FfqesJv9kcP1OvFeXa70Z8Ygmz1KWTCYX4fuDqlAQhnUVIWafQfesXjjgF5zlCrGWSBQuyOm1nuEARqGTqRgxKxejrm1iYL+URKPFEktJrGSDpRJ3aYlGYRhFwjK8T+lyle+1yrUsYjMM5ZG9l0tBzk3iYvGfWE6XVWYniyvEci1RgjEpZwP6Itwi7jfppHy31Mz3HSeGNZvw8aOAUs5h0olUqqqPFVIhjlcI34wXsMMuWWhEb76ibwPw1U1ibmCzwm+tdil3HEyfhcrdBhetbrW6pHe5RNxiVeTXukTcVEyevupCjA9YEqfT6XlyGXOKuINnQ1GnEy9y6uJeBuFn3qXxxyzmnP8Amz0wy7TM4YgAAAAASUVORK5CYII=","width":19}
%---
%[control:button:3644]
%   data: {"label":"Run","run":"Section"}
%---
%[control:editfield:5ccd]
%   data: {"defaultValue":0,"label":"a","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:233e]
%   data: {"defaultValue":0,"label":"x1","run":"Nothing","valueType":"Double"}
%---
%[control:editfield:799c]
%   data: {"defaultValue":0,"label":"x2","run":"Nothing","valueType":"Double"}
%---
