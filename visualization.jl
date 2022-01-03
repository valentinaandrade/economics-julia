## Plots
using Plots
using GR
using PGFPlotsX
using PyPlot
using UnicodePlots
using InspectDR
using StatsPlots
using GraphRecipes

x = 1:10; y = rand(10); # These are the plotting data
plot(x = x, y = y )

x = 1:10; y = rand(10, 2); # 2 columns means two lines
plot(x = x, y = y )

z = rand(10)
plot!(x, z)

x = 1:10; y = rand(10, 2); # 2 columns means two lines
p = plot(x = x , y = y );
z = rand(10);
plot!(p, x, z)


var1 = 1:10; var2 = rand(10, 2) # 2 columns means two lines
plot(x = var1 , y = var2 , title = "Two Lines", label = ["Line 1" "Line 2"], lw = 3)

xlabel!("My x label")

# Plotly
x = 1:10;
y = rand(10, 2)         # 2 columns means two lines in final plot
plotly()                # Here we are using Plotly backend
plot(x = x, y = y )

# Gr
x = 1:10;
y = rand(10, 2)         # 2 columns means two lines in final plot
gr()                    # Here we are using GR backend
plot(x = x, y = y)
