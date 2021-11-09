//
//  C64ConversionTests.swift
//  TenPrintCoverTests
//
//  Created by Raman Singh on 2021-03-15.
//  Copyright © 2021 NYPL_Labs. All rights reserved.
//

import XCTest

class C64ConversionTests: XCTestCase {
    
  func testC64ConverionWithEmptyString() {
    let stringToConvert = ""
    let expected = ""
    let result = C64Converter.convert(stringToConvert)
    XCTAssertEqual(expected, result)
  }
    
  func testC64ConverionWithNilString() {
    let stringToConvert: String? = nil
    let expected = ""
    let result = C64Converter.convert(stringToConvert)
    XCTAssertEqual(expected, result)
  }

  func testC64ConverionWithRegularString() {
    let stringToConvert = "Harry Potter"
    let expected = "Harry Potter"
    let result = C64Converter.convert(stringToConvert)
    XCTAssertEqual(expected, result)
  }
    
  func testC64ConverionWithAccentedString() {
    let books = ["Cien años de soledad", "El amor en los tiempos del cólera"]
    let converted = ["Cien avos de soledad", "El amor en los tiempos del cblera"]
    
    for i in 0..<books.count {
      let stringToConvert = books[i]
      let expected = converted[i]
        let result = C64Converter.convert(stringToConvert)
      XCTAssertEqual(expected, result)
    }
  }
    
  func testC64ConverionWithSpecialCharacters() {
    let testFeedUrl = Bundle.init(for: C64ConversionTests.self)
        .url(forResource: "SpecialChars", withExtension: "txt")!
    
    guard
      let data = try? Data(contentsOf: testFeedUrl),
      let stringToConvert = String(data: data, encoding: .utf8)
    else {
      XCTFail()
      return
    }
    
    let expected = "JJmlJjJkKlL:zZxXcC.V0123456789:67890.ABCDEFGHIJKLMNOPQRSTUVWXYZDfFgGhabcdefghijklmnopqrstuvwxyz56789W4LhjgJK:zlcXZkwBNV317HjkPYGxb2vUcc8x65hZ4KFNVvKMbcHzJk7nf6uDfGhaAoHF7UNL:cCBn12790. qQeErRtTyYuiIoOpPaAsSdDfHCnmM456T"
    let result = C64Converter.convert(stringToConvert)
    XCTAssertEqual(expected, result)
  }
    
  func testC64ConverionWithUnicodeCharecters() {
        
    // There are 143,859 unicode characters, and it is not feasible to test for
    // all of them. This list is limited to a subset of the most important characters
    // for English-language readers.
    
    let stringToConvert = "ʰʱʲʳʴʵʶʷʸʹʺʻʼʽʾʿˀˁ˂˃˄˅ˆˇˈˉˊˋˌˍˎˏːˑ˒˓˔˕˖˗˘˙˚˛˜˝˞˟ˠˡˢˣˤ˥˦˧˨˩˪˫ˬ˭ˮ˯˰˱˲˳˴˵˶˷˸˹˺˻˼˽˾˿ͰͱͲͳʹ͵Ͷͷͺͻͼͽ;Ϳ·΄΅Ά·ΈΉΊΌΎΏΐΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΪΫάέήίΰαβγδεζηθικλμνξοπρςστυφχψωϊϋόύώϏ·ϐϑϒϓϔϕϖϗϘϙϚϛϜϝϞϟϠϡϢϣϤϥϦϧϨϩϪϫϬϭϮϯϰϱϲϳϴϵ϶ϷϸϹϺϻϼϽϾϿЀЁЂЃЄЅІЇЈЉЊЋЌЍЎЏАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюяѐёђѓєѕіїјљњћќѝўџѠѡѢѣѤѥѦѧѨѩѪѫѬѭѮѯѰѱѲѳѴѵѶѷѸѹѺѻѼѽѾѿҀҁ҂ҊҋҌҍҎҏҐґҒғҔҕҖҗҘҙҚқҜҝҞҟҠҡҢңҤҥҦҧҨҩҪҫҬҭҮүҰұҲҳҴҵҶҷҸҹҺһҼҽҾҿӀӁӂӃӄӅӆӇӈӉӊӋӌӍӎӏӐӑӒӓӔӕӖӗӘәӚӛӜӝӞӟӠӡӢӣӤӥӦӧӨөӪӫӬӭӮӯӰӱӲӳӴӵӶӷӸӹӺӻӼӽӾӿ–—―‗‘’‚‛“”„†‡•…‰′″‹›‼‾⁄⁊▀▁▂▃▄▅▆▇█▉▊▋▌▍▎▏▐░▒▓▔▕▖▗▘▙▚▛▜▝▞▟■□▢▣▤▥▦▧▨▩▪▫▬▭▮▯▰▱▲△▴▵▶▷▸▹►▻▼▽▾▿◀◁◂◃◄◅◆◇◈◉◊○◌◍◎●◐◑◒◓◔◕◖◗◘◙◚◛◜◝◞◟◠◡◢◣◤◥◦◧◨◩◪◫◬◭◮◯◰◱◲◳◴◵◶◷◸◹◺◻◼◽◾◿"
    
    let expected = "L:zZxXcCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmkKlLVzZxCvVb6nM234M6780 qQwWeErRtTyYuUiIoOpaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890. MqQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbB4567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcaAsdDfFgGhHJkKznmM679.eyCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZxXcCvVbBnNmM1234567890. qQwWeErRtTyYuUiIoOpPaAsSdDfFgGhHjJkKlL:zZx"
    
    let result = C64Converter.convert(stringToConvert)
    XCTAssertEqual(expected, result)
  }

}

