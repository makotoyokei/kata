require File.join(File.dirname(__FILE__), "gilded_rose")

describe GildedRose do

  describe "#update_quality" do
    let(:items) { [item] }
    subject { GildedRose.new(items).update_quality }
    context "ItemがAged Brieの場合" do
      let(:item) { Item.new("Aged Brie", 0, 0) }
      it "名前が変わらないこと" do
        subject
        expect(item.name).to eq "Aged Brie"
      end
      context "Qualityが50未満の場合" do
        context "残り日数がある場合" do
          let(:item) { Item.new("Aged Brie", 1, 0) }
          context "残り日数が1日減ると" do
            it "Qualityが1増えること" do
              subject
              expect(item.quality).to eq (0 + 1)
            end
          end
        end
        context "残り日数がない場合" do
          let(:item) { Item.new("Aged Brie", 0, 0) }
          context "残り日数が1日減ると" do
            it "Qualityが2増えること" do
              subject
              expect(item.quality).to eq (0 + 2)
            end
          end
        end
      end
      context "Qualityが50の場合" do
        let(:item) { Item.new("Aged Brie", 0, 50) }
        context "残り日数が1日減ると" do
          it "Qualityが変わらないこと" do
            subject
            expect(item.quality).to eq (50 + 0)
          end
        end
      end
    end
    context "ItemがBackstage passesの場合" do
      context "Qualityが47以下の場合" do
        context "残り日数が11日以上の場合" do
          let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 40) }
          context "残り日数が1日減ると" do
            it "Qualityが1増えること" do
              subject
              expect(item.quality).to eq (40 + 1)
            end
          end
        end
        context "残り日数が6日以上11日未満の場合" do
          context "残り日数が1日減ると:境界値の上限確認" do
            let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 40) }
            it "Qualityが2増えること" do
              subject
              expect(item.quality).to eq (40 + 2)
            end
          end
          context "残り日数が1日減ると:境界値の下限確認" do
            let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 40) }
            it "Qualityが2増えること" do
              subject
              expect(item.quality).to eq (40 + 2)
            end
          end
        end
        context "残り日数が6未満の場合" do
          context "残り日数が1日減ると:境界値の上限確認" do
            let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 40) }
            it "Qualityが3増えること" do
              subject
              expect(item.quality).to eq (40 + 3)
            end
          end
          context "残り日数が1日減ると:境界値の下限確認" do
            let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 40) }
            it "Qualityが3増えること" do
              subject
              expect(item.quality).to eq (40 + 3)
            end
          end
        end
        context "残り日数がない場合" do
          context "残り日数が1日減ると" do
            let(:item) { Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 40) }
            it "Qualityが3増えること" do
              subject
              expect(item.quality).to eq (0)
            end
          end
        end
      end
    end
    context "ItemがSulfurasの場合" do
      let(:item) { Item.new("Sulfuras, Hand of Ragnaros", 5, 40) }
      context "残り日数が1日減ると" do
        it "Qualityが変わらないこと" do
          subject
          expect(item.quality).to eq (40 + 0)
        end
      end
    end
    context "Itemがそれ以外の場合" do
      context "Qualityが正の数の場合" do
        context "残り日数がある場合" do
          let(:item) { Item.new("other item", 5, 40) }
          context "残り日数が1日減ると" do
            it "Qualityが1減ること" do
              subject
              expect(item.quality).to eq (40 - 1)
            end
          end
        end
        context "残り日数がない場合" do
          context "残り日数が1日減ると" do
            let(:item) { Item.new("other item", 0, 40) }
            it "Qualityが2減ること" do
              subject
              expect(item.quality).to eq (40 - 2)
            end
          end
        end
      end
      context "Qualityが0の場合" do
        let(:item) { Item.new("other item", 5, 0) }
        context "残り日数が1日減ると" do
          it "Qualityが変わらないこと" do
            subject
            expect(item.quality).to eq (0)
          end
        end
      end
    end
  end

end
