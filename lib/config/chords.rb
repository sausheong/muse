# major
def _CM(options={})
  add_to_stream chord(%w(c2 e2 g2), options)
end

def _FM(options={})
  add_to_stream chord(%w(f2 a2 c3), options)
end




# minor
def _Dm(options={})
  add_to_stream chord(%w(d2 f2 a2), options)
end

# dominant 7th
def _C7(options={})
  add_to_stream chord(%w(c2 e2 g2 ais2), options)
end

def _BbM(options={})
  add_to_stream chord(%w(ais2 d3 f3), options)
end
