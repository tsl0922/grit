module Grit
  class Diff

    def old_path
      GritExt.encode! @a_path
    end

    def new_path
      GritExt.encode! @b_path
    end

    def diff
      if @diff.nil?
        @diff = ""
      else
        lines = @diff.lines.to_a
        path = GritExt.encode! lines.shift(2).join
        body = GritExt.encode! lines.join
        # test encoding
        begin
          @diff = path + body
          @diff.inspect
        rescue
          @diff.force_encoding("BINARY")
        end
        @diff
      end
    end
  end
end
