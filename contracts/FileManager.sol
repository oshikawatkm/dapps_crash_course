pragma solidity >=0.6.0 < 0.7.0;

contract FileManager {
  
  event fileLog(address _user, string _fileName, string text);
  
  struct File {
    address owner;
    string fileHash;
    string fileName;
    uint created_at;
  }
 //コメント
  mapping (address => File[]) files;

  function upload(string memory _fileHash, string memory _fileName, uint _date) public {
    files[msg.sender].push(File({owner: msg.sender, fileHash: _fileHash, fileName: _fileName, created_at: _date}));
    emit fileLog(msg.sender, _fileName, "upload");
  }

  function download(uint _index) public payable returns (string memory) {
    File memory file = files[msg.sender][_index];
    require (file.owner == msg.sender);
    emit fileLog(msg.sender, file.fileName, "download");
    return (file.fileHash);
  }

  function getInfo(uint _index) public view returns (address, string memory, uint) {
    File memory file = files[msg.sender][_index];
    return (file.owner, file.fileName, file.created_at);
  }

  function getLength() public view returns (uint) {
    return (files[msg.sender].length);
  }
}