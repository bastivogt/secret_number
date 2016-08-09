module SecretNumber
  class Lang
    @@text
    def self.text
      @@text
    end

    def self.prepare(min: 0, max: 1, count: 0, secret_num: 0, level: 0)
      @@text = {
          start: "Finde die geheime Zahl im Bereich von #{min} - #{max}",
          to_low: "Versuch #{count}: zu klein",
          to_height: "Versuch #{count}: zu groß",
          out_of_range: "Versuch #{count} außerhalb des Bereiches #{min} - #{max}",
          matched: "Super, du hast die geheime Zahl #{secret_num} in #{count} gefunden.",
          aborted: "Schade, das du das Spiel abgebrochen hast. Die geheime Zahl ist #{secret_num}.",
          level: "Level #{level}"
      }
    end

  end
end