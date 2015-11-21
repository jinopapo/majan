module ScoreLib
  def uma(score)
    uma = [-10,-5,5]
    for i in 0..3 do
      score[i][:rank] = 3-i
    end
    score = score.sort_by do |var|
      [var[:score], var[:rank]]
    end
    top_score = 0
    for num in 0..2 do
      score[num][:score] += 400
      score[num][:score] = (score[num][:score]/1000).to_i
      score[num][:score] = uma[num] + score[num][:score] - 30
      top_score += score[num][:score]
    end
    score[3][:score] = -top_score
    out = [{},{},{},{}]
    for i in 0..3 do
      out[i][:score] = score[i][:score]
      out[i][:name] = score[i][:name]
    end
    return out
  end
end
