module Modules
  module Base32
    module_function

    def encode32hex(str)
      str.gsub(/\G(.{5})|(.{1,4}\z)/mn) do
        full = Regexp.last_match(1); frag = Regexp.last_match(2)
        n, c = (full || frag.ljust(5, "\0")).unpack('NC')
        full = ((n << 8) | c).to_s(32).rjust(8, '0')
        if frag
          full[0, (frag.length * 8 + 4).div(5)].ljust(8, '=')
        else
          full
        end
      end
    end

    HEX = '[0-9a-v]'.freeze
    def decode32hex(str)
      str.gsub(/\G\s*(#{HEX}{8}|#{HEX}{7}=|#{HEX}{5}={3}|#{HEX}{4}={4}|#{HEX}{2}={6}|(\S))/imno) do
        raise 'invalid base32' if Regexp.last_match(2)

        s = Regexp.last_match(1)
        s.tr('=', '0').to_i(32).divmod(256).pack('NC')[0, (s.count('^=') * 5).div(8)]
      end
    end
  end
end
