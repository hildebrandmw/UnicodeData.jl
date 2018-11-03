using UnicodeData
using Test

@testset "Testing Proper Translation" begin
    @test udata('A') == "Latin Capital Letter A"
    @test udata('A') == udata(0x0041)

    @test udata('\uFF01') == "Fullwidth Exclamation Mark"
    @test udata('\uFF00') == nothing

    # Test the higher planes as well.
    @test udata(0x13201) == "Egyptian Hieroglyph N018a"
    @test udata(0x2FA00) == "CJK Compatibility Ideograph-2Fa00"
    @test udata(0xE005F) == "Tag Low Line"
end
