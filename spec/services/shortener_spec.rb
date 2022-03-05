require "rails_helper"

RSpec.describe Shortener do 
  it 'shortens a given URL to a 7 character lookup code' do 
    url = 'https://www.amazon.com/AmeriTop-Wireless-Adjustable-Illumination-Waterproof/dp/B07XLF6QHV/?_encoding=UTF8&pd_rd_w=hecuJ&pf_rd_p=f72fe2bc-f0d6-4bb0-94c8-0240318ad8f5&pf_rd_r=ERHTJW4MQVDX43ZJMPAA&pd_rd_r=68af5d79-58f9-467e-8415-666d698a3bd2&pd_rd_wg=Rytgg&ref_=pd_gw_trq_ed_59a7xkko'
    shortener = Shortener.new(url)
    expect(shortener.lookup_code.length).to eq(7)
  end

  it 'gives each URL its own lookup code' do 
    url = 'https://www.amazon.com/AmeriTop-Wireless-Adjustable-Illumination-Waterproof/dp/B07XLF6QHV/?_encoding=UTF8&pd_rd_w=hecuJ&pf_rd_p=f72fe2bc-f0d6-4bb0-94c8-0240318ad8f5&pf_rd_r=ERHTJW4MQVDX43ZJMPAA&pd_rd_r=68af5d79-58f9-467e-8415-666d698a3bd2&pd_rd_wg=Rytgg&ref_=pd_gw_trq_ed_59a7xkko'
    shortener = Shortener.new(url)
    code_1 = shortener.lookup_code

    url = 'https://cook.com/how-to-make-sushi'
    shortener = Shortener.new(url)
    code_2 = shortener.lookup_code

    expect(code_2).not_to eq(code_1)
  end

  it 'always gives the same URL the same look up code' do
    url = 'https://www.amazon.com/AmeriTop-Wireless-Adjustable-Illumination-Waterproof/dp/B07XLF6QHV/?_encoding=UTF8&pd_rd_w=hecuJ&pf_rd_p=f72fe2bc-f0d6-4bb0-94c8-0240318ad8f5&pf_rd_r=ERHTJW4MQVDX43ZJMPAA&pd_rd_r=68af5d79-58f9-467e-8415-666d698a3bd2&pd_rd_wg=Rytgg&ref_=pd_gw_trq_ed_59a7xkko'
    shortener = Shortener.new(url)
    first_code = shortener.lookup_code

    url = 'https://cook.com/how-to-make-sushi'
    shortener = Shortener.new(url)
    second_code = shortener.lookup_code

    expect(first_code).to eq(second_code)
  end
end