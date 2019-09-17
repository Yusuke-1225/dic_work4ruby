class Player
  def hand

      puts "じゃんけん、、"
      puts "[0]:グー\n[1]:チョキ\n[2]:パー"
      player_hand = gets.chomp
      # 文字列で入力待ち
      while true

      unless player_hand == "0" || player_hand == "1" || player_hand == "2"
        # 前がchompなので文字列で条件分岐
        puts "値が無効です"
        puts "0~2の数字を入れてください"

        player_hand = gets.chomp
        # 無限ループしないように文字入力待ちをする
      else
        #0 1 2 の場合の処理 false(ループ抜けられる)
        return player_hand.to_i
        #数値として返却
      end

    end

      jankens = ["グー", "チョキ", "パー"]
        puts "あなたの手:#{jankens[player_hand]}"
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
  end
end

class Enemy
  def hand
    enemy_hand = rand(0..2)
    #ランダムで0~2を出力

    jankens = ["グー", "チョキ", "パー"]
    puts "相手の手:#{jankens[enemy_hand]}"
    return enemy_hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する

  end
end

class Janken
  def pon(player_hand, enemy_hand)

    result = (player_hand - enemy_hand + 3 )% 3

    if result == 2
      puts "あなたの勝ちです"
    elsif result == 1
      puts "あなたの負けです"
    else
      puts "あいこ"
      player = Player.new
      enemy = Enemy.new
      janken = Janken.new
      janken.pon(player.hand, enemy.hand)
      #class内でジャンケンを起動

      # self.pon(player.hand, enemy.hand)
    end


    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)
