"""Take an image as input and output the class."""
from PIL import Image
import torch
from torchvision import models, transforms

# dictionary mapping imagenet indices to target classes
name_mapper = {
    292: 'Tiger',
    385: 'Elephant',
    386: 'Elephant',
    366: 'Gorilla',
    34: 'Sea Turtle'
}


def transform():
    transformer = transforms.Compose([
        transforms.Resize(256),
        transforms.CenterCrop(224),
        transforms.ToTensor(),
        transforms.Normalize(
            mean=[0.485, 0.456, 0.406],
            std=[0.229, 0.224, 0.225]
        )
    ])
    return transformer


def classify(path_to_image):
    """
    Classify an image using pretrained MobileNet model given the image path.
    Inputs:
        path_to_image (str): path to the image
    Returns:
        str: the top class if it belongs to one of the target classes of animals, else "other".
    """
    mobilenet = models.mobilenet_v2(pretrained=True)
    mobilenet.eval()
    transformer = transform()
    img = Image.open(path_to_image)
    transformed_img = transformer(img)
    batch_t = torch.unsqueeze(transformed_img, 0)
    out = mobilenet(batch_t)
    _, index = torch.max(out, 1)
    index = index.numpy()[0]
    if index in name_mapper.keys():
        return name_mapper[index]
    else:
        print(index)
        return 'other'


