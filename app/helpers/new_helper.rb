module NewHelper
  def placeholder
    <<-"EOS".strip_heredoc

    自分の悩みを書き出してみましょう。
    誰かにみられることは気にせず思いのままに今の悩みや不満を書き込んでください。
    
    例） 学校でまた嫌なことがあった、、なんで俺だけ！！
    EOS
  end

  def badholder
    <<-"EOS".strip_heredoc
    
    感謝できないことは当然です。
    ただそんな中でもイヤミでも結構ですので今日あった嬉しいことなどを書き込んでください。
    
    思いつかない時→最低限の食事があって感謝
    
    EOS
  end

  def yellholder
    <<-"EOS".strip_heredoc
    
    相手を思いやるエールを送ってみましょう。
    もちろんですが、暴言や心ないコメントは厳禁です！
    
    また本当に疲れている人の投稿には「がんばれ！」もお控えください。
    
    EOS
  end

end