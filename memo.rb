require "csv"

puts "1(新規でメモを作成) 2(既存のメモを編集する)"

memo_type = gets.to_i

if memo_type == 1
    puts "新規メモの作成。拡張子を除いた作成するファイル名を入力してください。"
    
    file_name = gets.chomp

    puts "メモの内容を入力してください。"
    puts "完了したら Ctrl + D を押してください。"

    input_memo = $stdin.read.chomp

    CSV.open("#{file_name}.csv", "w") do |csv|
    csv.puts ["#{input_memo}"]
    end


elsif memo_type == 2
    puts "既存メモの編集。拡張子を除いた編集するファイル名を入力してください。"
   
    file_name = gets.chomp

    begin
    puts CSV.read("#{file_name}.csv")
    
    puts "編集内容を入力してください。"
    puts "完了したら Ctrl + D を押してください。"

    input_memo = $stdin.read.chomp

    CSV.open("#{file_name}.csv", "w") do |csv|
    csv.puts ["#{input_memo}"]
    end

    rescue
    puts "既存のファイル名を入力してください。"
    end

else
    puts "1か2を入力してください。"
end