final class Attachment {
  late String filePath;
  late String fileName;
  late int fileSize;
  late DateTime insertedAt;

  Attachment(this.fileName, this.filePath, this.fileSize, this.insertedAt);
}
