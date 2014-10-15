
f = File.new("hicp.csv" , "r")
hicp = f.readlines
f.close



#calculating mean
sum = 0 
hicp.each do |hicp|
	sum = sum + hicp.to_f
end


mean = sum.round(2)/(hicp.size)
puts "The mean HICP data point is:"
puts mean.round(2).to_s
#calculating standard deviation
numerator_final = 0 
hicp.each do |hicp|
	numerator_sd = (hicp.to_f - mean)**2
	numerator_final = numerator_sd + numerator_final
end
final_sx = ((numerator_final)/(hicp.size - 1))**0.5
puts "The standard deviation for this data on HICP is:"
puts final_sx.round(2).to_s
#create a file with z scores
n = File.new("hicp_z_scores.dat", "w")
hicp.each do |hicp|
	z_score = (hicp.to_f - mean)/(final_sx)
	data = hicp + "," + z_score.round(2).to_s
	n.puts data
	puts data
end
n.close
"The list of z_scores for each point is as follows:"
