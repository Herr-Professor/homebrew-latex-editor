class LatexEditor < Formula
  desc "Terminal-native LaTeX editor with inline preview"
  homepage "https://github.com/Herr-Professor/latex-editor"
  url "https://github.com/Herr-Professor/latex-editor/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "259212b5195ff5b12fceed078b371941030a59f35a28e8f3a26e58abf8639c62"
  license "MIT"
  head "https://github.com/Herr-Professor/latex-editor.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "nlohmann-json"
  depends_on "ncurses"
  depends_on "poppler"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args,
           "-DLE_BUILD_TESTS=OFF",
           "-DLE_ENABLE_POPPLER=ON",
           "-DLE_ENABLE_MATH_ART=ON"
    system "cmake", "--build", "build"
    bin.install "build/latex-editor"
  end

  test do
    assert_predicate bin/"latex-editor", :exist?
    assert_predicate bin/"latex-editor", :executable?
  end
end
