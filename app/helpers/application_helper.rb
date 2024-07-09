module ApplicationHelper

  def default_meta_tags 
    {
      site: 'Yoga Diary',
      title: 'Yoga Diary',
      reverse: true,
      charset: 'utf-8',
      description: '毎日ひとつのYogaを実践・記録するサービスです！運動習慣のきっかけに',
      keywords: 'スポーツ,ヨガ,日記',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), 
        local: 'ja-JP'
      },
      twitter: {
        site_name: :site,
        title: :title,
        card: 'summary_large_image', 
        image: image_url('ogp.png') 
      }
    }
  end

  def page_title(title = '')
    base_title = 'Yoga Diary'
    title.present? ? "#{title} | #{base_title}" : base_title
  end
end
