require 'rails_helper'

RSpec.describe Shortener do 
  it 'shortens a given URL to a 7 character lookup code' do 
    url = 'https://www.amazon.com/AmeriTop-Wireless-Adjustable-Illumination-Waterproof/dp/B07XLF6QHV/?_encoding=UTF8&pd_rd_w=hecuJ&pf_rd_p=f72fe2bc-f0d6-4bb0-94c8-0240318ad8f5&pf_rd_r=ERHTJW4MQVDX43ZJMPAA&pd_rd_r=68af5d79-58f9-467e-8415-666d698a3bd2&pd_rd_wg=Rytgg&ref_=pd_gw_trq_ed_59a7xkko'
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end
end