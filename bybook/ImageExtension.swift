//
//  ImageExtension.swift
//  bybook
//
//  Created by Владимир Рябов on 23.01.2022.
//

import SwiftUI

extension Image {

  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: width, height: height)
  }
}

