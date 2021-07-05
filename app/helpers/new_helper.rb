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

end